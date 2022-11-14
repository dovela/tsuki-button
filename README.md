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
