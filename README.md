# 梦魇Tsuki 按钮 / 梦魇月按钮

### 梦魇月……梦魇月……还有稿子要画

 - https://button.mytsuki.cn

### 相关链接：

- [梦魇Tsuki 的 Bilibili 直播间](https://live.bilibili.com/851181)

### 参与完善本项目

- 您可以在[Issues](https://github.com/dovela/tsuki-button/issues)提出您的建议

  - 若是请求添加新语音，请使用指定的**issues模板**
  - 不熟悉**github**的用法也可以到[Bilibili](https://space.bilibili.com/2662353)和我联系

- 如果您可以进行开发，那么请**Fork**本项目进行修改，完成修改后在本项目中发起一个**Pull Request**，详细说明请查看以下条目
  > **Pull Request**请提交至**dev**分支

### 添加或修改音频/完善翻译

音频文件推荐使用**mp3**格式，请先音量标准化，然后放入`public/voices/`目录

所有的分类和音频信息都存储在`setting/translate`目录的`json`文件中，**添加或修改音频信息**、**完善翻译**，你需要修改对应文件中的内容

`locales.json`和`category.json`分别为 UI 界面翻译和分类信息，**不要修改，除非你打算接手维护**

请新建`json`文件，注意文件名一致，**允许**留下你的id（可以使用中文、数字、字母、下划线的组合），例：`02_dovela_22.08.22.json`

语音文件结构示例如下：

```jsonc
[
  {
    // 语音命名
    "name": "我梦魇tsuki求求你不要切",
    // 语音文件名
    "path": "我梦魇tsuki求求你不要切.mp3",
    // 添加日期
    "date": "2022-8-22",
    "translate": {
      // 语音中文翻译
      "zh-CN": "我梦魇tsuki求求你不要切",
      // 语音英语翻译（本仓库已弃用，为避免bug勿删）
      "en-US": "nya nya nya~"
    },
    // 语音所属分类(日常、歌、梗、其他人格)
    "category": "日常"
  },  // 记得半角逗号
  {
  ……
  }  // 结尾没有逗号
]  // 每一条刚好是十行，可以很方便的查漏补缺
```

### 部署项目

首先你的计算机应该已经部署了`node.js`并正确设置了环境变量

```shell
cd tsuki-button
yarn install  // 安装所需插件
# npm run server  // 本地测试
npm run build  // 打包网站
```

会在工程根目录下生成一个`dist`文件夹，复制到自己的服务器上搭建就好了，如何搭建网站不在本文叙述范围

本地测试的话，执行`npm run serve`，命令行会给一个网址`http://localhost:端口`。但是如果点任何一个按钮网站都会崩溃，是正常现象，生产条件下搭建的网站正常

### 使用 Docker 发布

如果想把编译和部署封装进容器，可以直接使用仓库根目录的 `Dockerfile`：

```bash
# 1. 准备证书目录和nginx配置目录
mkdir /path/to/button_ssl
# fullchain.pem （预先在云服务商申请 fullchain.pem / privkey.key）
# privkey.key
mkdir /path/to/button_nginx
# nginx.conf （复制docker/nginx.conf）

# 2. 打包镜像
docker build -t tsuki-button .

# 3. 本地跑容器测试。http://127.0.0.1/
docker run -d --name tsuki-button \
  -p 80:80 -p 443:443 \
  -v /path/to/button_ssl:/etc/nginx/ssl:ro \
  -v /path/to/button_nginx:/etc/nginx/button_conf:ro \
  tsuki-button

# 如需推送到 Docker Hub，可按以下步骤：
# 1. 登录 Docker Hub
docker login

# 2. 打标签并推送
docker tag tsuki-button dovela/tsuki-button:latest
docker push dovela/tsuki-button:latest

# -------------------------------------------------

# 本仓库已发布到Docker Hub，可以直接运行
docker run -d --name tsuki-button \
  -p 80:80 -p 443:443 \
  -v /path/to/button_ssl:/etc/nginx/ssl:ro \
  -v /path/to/button_nginx:/etc/nginx/button_conf:ro \
  dovela/tsuki-button:latest
```

镜像包含两个阶段：`node:20-alpine` 完成 `npm ci && npm run build`，随后进入 `nginx:alpine`。`docker/nginx.conf` 默认把 80 端口 301 跳转到 HTTPS，并在 443 上启用 HTTP/2、HSTS、静态资源缓存。TLS 配置同时启用 TLS 1.3 与 TLS 1.2，保证旧终端也能握手。请在宿主机准备好以 `fullchain.pem` 与 `privkey.key` 命名的证书与私钥文件，运行时挂载至 `/etc/nginx/ssl` 即可。如果只需 HTTP，可临时把挂载去掉并改写配置后重建镜像。

> **注意事项**
> - 80 端口只做跳转，请通过 `https://` 访问映射到 443 的端口，否则浏览器会提示 “plain HTTP request was sent to HTTPS port”。
> - 镜像不会携带任何证书/密钥，如果挂载目录为空，Nginx 会因为找不到 `/etc/nginx/ssl/fullchain.pem` 而直接退出。
> - Nginx 配置默认使用仓库内的 `docker/nginx.conf`，若需要自定义配置可在宿主机准备 `/path/to/button_nginx/nginx.conf` 并挂载到 `/etc/nginx/button_conf`。
> - 如果需要把镜像推送到 Docker Hub，请在构建之前确认 `Dockerfile` 未 `COPY` 任何私钥或敏感文件，当前配置已经满足。
> - 访问日志与错误日志会输出到容器标准输出，可通过 `docker logs -f tsuki-button` 排查。

> **Nginx 配置说明**
> - `docker/nginx.conf` 在每个 `server` 块内检测 `$host`，拒绝空 Host/纯 IP 的访问，默认允许任意域名。
> - 如需限制为单一域名，只需把两个 `server_name _;` 替换为 `server_name button.mytsuki.cn;`（示例），并保证证书 CN/SAN 匹配。
> - 如果挂载了 `/etc/nginx/button_conf/nginx.conf`，容器会优先使用该文件；否则继续使用项目内默认配置。

迁移到其它服务器时，把仓库同步过去执行 `docker build`，或把镜像推送到镜像仓库后在目标服务器直接 `docker run` 并挂上相应证书即可完成部署。

### 标准工作流程

[![](https://mermaid.ink/img/pako:eNpVku9v0kAcxv-V5l4YTBiBllHoC40CY8yX6BspLxo4BgmFppbppCRzjgFGByMbOp1idPHH4kYzFSsI-2PsXct_4UGpxnt1d_nc83yfJ1cB6VIGAg6sy4KUo27f5IsUWTeS1t4P1Oqi8SHunOFhG3frxmjgyRY2UtQCoZaWrlEqD7JZUYLrv7ceJXIlJV1WyA5pLUPXzbOmNR5N6y3UPLUm-9a4TyR4oIZdhr6Fz7-bF89RY2C-3BElZtr7On23f9WWDs-lIxX8oo_aH_Bx03r8FB_18ettgl2v2lBkBqkEUamoK2mML82DTwmpAKEC5didOG61yfzGcIjea6j_E_cP8GEDvzlOLTyic4-Vik3YTsbombkzwHoNH2mOzYodc-YTcyWRtntf2LDGX3CjTaZ2xBYQkVBXnVnQXs8O5UAx6gq1OgfjDkMkInkZppVwWcGNLqoNjFHX7sm8mJDanLeRfwZx-yY-v1lzoQkpUSOFGvopqr81P3amnR7plIQi9nYWu2KzWSelLwTXFrFabfsp_rVtDM8JKMnqraShn6CTz2i3ZuhPzOElfvUNd7UUcAMRyqKQz5D_Upnp8EDJQRHygCPbDMwK5YLCA75YJWhZyggKjGbySkkGXFYo3INuIJSVUmKzmAacIpehA0XyAvl-4l9KEop3S6X_zoCrgAeA87GMx7vM0AGaYdiQn_GzbrAJuCWf1-cJLLN-lg3SvpCXZQNVN3g41_B5_LQ_FPIGQ7Tf56XZIFP9A-XmWOw)](https://mermaid.live/edit#pako:eNpVku9v0kAcxv-V5l4YTBiBllHoC40CY8yX6BspLxo4BgmFppbppCRzjgFGByMbOp1idPHH4kYzFSsI-2PsXct_4UGpxnt1d_nc83yfJ1cB6VIGAg6sy4KUo27f5IsUWTeS1t4P1Oqi8SHunOFhG3frxmjgyRY2UtQCoZaWrlEqD7JZUYLrv7ceJXIlJV1WyA5pLUPXzbOmNR5N6y3UPLUm-9a4TyR4oIZdhr6Fz7-bF89RY2C-3BElZtr7On23f9WWDs-lIxX8oo_aH_Bx03r8FB_18ettgl2v2lBkBqkEUamoK2mML82DTwmpAKEC5didOG61yfzGcIjea6j_E_cP8GEDvzlOLTyic4-Vik3YTsbombkzwHoNH2mOzYodc-YTcyWRtntf2LDGX3CjTaZ2xBYQkVBXnVnQXs8O5UAx6gq1OgfjDkMkInkZppVwWcGNLqoNjFHX7sm8mJDanLeRfwZx-yY-v1lzoQkpUSOFGvopqr81P3amnR7plIQi9nYWu2KzWSelLwTXFrFabfsp_rVtDM8JKMnqraShn6CTz2i3ZuhPzOElfvUNd7UUcAMRyqKQz5D_Upnp8EDJQRHygCPbDMwK5YLCA75YJWhZyggKjGbySkkGXFYo3INuIJSVUmKzmAacIpehA0XyAvl-4l9KEop3S6X_zoCrgAeA87GMx7vM0AGaYdiQn_GzbrAJuCWf1-cJLLN-lg3SvpCXZQNVN3g41_B5_LQ_FPIGQ7Tf56XZIFP9A-XmWOw)

或者

[![](https://mermaid.ink/img/pako:eNqrVkrOT0lVslJKL0osyFAIcYnJUwACx-jSgid7Fzxr6Huys-PF_hlPdvQ-m73l2bQNsQq6unY1z9d2Pt3X-mzqhqcTV9QoOEU_n7Lxya6-530bnq6b97Rv_tPZC542zgFqiAWaFpOnpKOUm1qUm5iZArSnGmRBjFJJRmpuaoySFZCZkpqWWJpTEqMUk1cLVFpakJJYkuqaklmSX6RklZaYU5yqo5RYWpIfXJmXrGRVUlSaClPkkpkIdHYuXFVBYl5Ufj6MXwsAYV9fVg)](https://mermaid.live/edit#pako:eNqrVkrOT0lVslJKL0osyFAIcYnJUwACx-jSgid7Fzxr6Huys-PF_hlPdvQ-m73l2bQNsQq6unY1z9d2Pt3X-mzqhqcTV9QoOEU_n7Lxya6-530bnq6b97Rv_tPZC542zgFqiAWaFpOnpKOUm1qUm5iZArSnGmRBjFJJRmpuaoySFZCZkpqWWJpTEqMUk1cLVFpakJJYkuqaklmSX6RklZaYU5yqo5RYWpIfXJmXrGRVUlSaClPkkpkIdHYuXFVBYl5Ufj6MXwsAYV9fVg)

录播源可以从月频取得，如果决定要协助添加音频，可以私信月月子索要在线录播站，她可能会给你。

图中提到的是我的常用工具也足够可靠，如果使用在线剪辑网站，一定要注意**是否存在码率压缩降低**的情况，虽然并不是无法容许的，但是建议不要这么做。

##### 特别注意

- 如果mp3文件名包含英文句点 `.` 会造成音频无法正常显示，统一在`name`和`path`替换为下划线 `_` ，如`《8_32》`，`zh-CN`使用英文句点 `.` ，如`《8.32》`。

- 大部分歌切声音很小，请适当增幅（一般+6~+10.5），音量参考《yona yona dance》。

### 相关工具

ffmpeg : https://github.com/FFmpeg/FFmpeg/releases

jijidown : http://client.jijidown.com/ (右键提取mp3和flv转mp4工具很好用)

SpleeterGUI : https://makenweb.com/SpleeterGUI

mp3DirectCut : https://mpesch3.de/

或者自行百度取得

### LICENSE

- 项目使用**GPL-3.0**为基础开源协议
- 本项目修改自 [Hiiro按钮](https://github.com/blacktunes/hiiro-button) ，原作者 [blacktunes](https://github.com/blacktunes) 
