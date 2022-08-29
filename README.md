# 梦魇Tsuki 按钮 / 梦魇月按钮

### 梦魇月……梦魇月……还有稿子要画

 - https://button.mytsuki.cn

### 相关链接：

- [梦魇Tsuki 的 Bilibili 直播间](https://live.bilibili.com/851181)

### 参与完善本项目

- 您可以在[Issues](https://github.com/dovela/tsuki-button/issues)提出您的建议。

  - 若是请求添加新语音，请使用指定的**issues模板**
  - 不熟悉**github**的用法也可以到[Bilibili](https://space.bilibili.com/2662353)和我联系

- 如果您可以进行开发，那么请**Fork**本项目进行修改，完成修改后在本项目中发起一个**Pull Request**，详细说明请查看以下条目
  > **Pull Request**请提交至**dev**分支

### 添加或修改音频/完善翻译

音频文件推荐使用**mp3**格式，请先音量标准化，然后放入`public/voices/`目录

所有的分类和音频信息都存储在`setting/translate`目录的`json`文件中，**添加或修改音频信息**、**完善翻译**，你需要修改对应文件中的内容

`locales.json`和`category.json`分别为 UI 界面翻译和分类信息，**不要修改，除非你打算接手维护**

请新建`json`文件，注意文件名一致，**允许**留下你的id（不知道有没有适配，如果要的话建议使用英文id，可以去原作者那里提issue问他），例：`02_dovela_22.08.22.json`

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
    // 语音所属分类(日常、歌、梗)
    "category": "日常"
  },  // 记得半角逗号
  {
  ……
  }  // 结尾没有逗号
]
```

### 部署项目

首先你的计算机应该已经部署了`node.js`并正确设置了环境变量

```shell
cd tsuki-button
yarn install  // 安装所需插件
npm run build  // 打包网站
```

会在工程根目录下生成一个`dist`文件夹，复制到自己的服务器上搭建就好了，如何搭建网站不在本文叙述范围

本地测试的话，执行`npm run serve`，命令行会给一个网址`http://localhost:端口`，但是如果点任何一个按钮网站都会崩溃，是正常现象，生产条件下搭建的网站正常

### 标准工作流程

[![](https://mermaid.ink/img/pako:eNpVUl1vEkEU_SuTeaIJS_aDsrAPJvJRqq_VF4GHDTu0JMBulgWtLIkptoAxgqRQ0dY2af1qtBA_KqUF_szOLP0XDiwYnad7Muece-_JLcGkqiAowU1d1rbAg2A8B-i7G5u--o0bHTxqk9Y3MmySTtW6vvSkMsUEYJg7QVcslcpqaBMwaeCQZn-AyecBy0osJ7EsYAx1ATgKijnAJCUZZDUByAUlrXpolVhZ9JuZgpArhncvrevOtDLC4wNc61OK_fY5rp9Px69J5wrfNJaK4FwRLpE3Pdz8SA7r08pL0u2Ro53b4x9lhxNyOA4Iz4BJiSaIuGLWaGLvf97QMggZSI8-vEcaTbqvNRzi0z7uXZHePmnXyPvDZb_I3Mt0dM7uuL_3WC5OR19JrUkHNddc1uTIbnen4wr-MKJzW4Nndr228k9_YJKDEzPqcmyoKJzWUdIIFQxS6yx2H_Vo0vb3Md16IV2bS6MOiM7BussJiLawBue4emJ_at22jmdhnfZpAmSwS7p9CmcJ1qvk4tfCa30xRqPpSMnNjjW8oERNN-_HrMEZPvuC93atwQt7OCHvfpJOPwHdMIv0rJxW6KGUZj5xaGyhLIpDiZYKSsmFjBGH8VyZUguaIhsooqQNVYdSSs7kkRvKBUPd2M4loWToBbQkhdMyvbvsX5Ym5x6p6n8YSiX4BEqcKHjYVYH38YIgBryCV3TDbSgxHMt5fKuiVxT9PBdgRdFXdsOncw_O4-W9gQDrD_BejuVFv1D-A9m2RbM)](https://mermaid.live/edit#pako:eNpVUl1vEkEU_SuTeaIJS_aDsrAPJvJRqq_VF4GHDTu0JMBulgWtLIkptoAxgqRQ0dY2af1qtBA_KqUF_szOLP0XDiwYnad7Muece-_JLcGkqiAowU1d1rbAg2A8B-i7G5u--o0bHTxqk9Y3MmySTtW6vvSkMsUEYJg7QVcslcpqaBMwaeCQZn-AyecBy0osJ7EsYAx1ATgKijnAJCUZZDUByAUlrXpolVhZ9JuZgpArhncvrevOtDLC4wNc61OK_fY5rp9Px69J5wrfNJaK4FwRLpE3Pdz8SA7r08pL0u2Ro53b4x9lhxNyOA4Iz4BJiSaIuGLWaGLvf97QMggZSI8-vEcaTbqvNRzi0z7uXZHePmnXyPvDZb_I3Mt0dM7uuL_3WC5OR19JrUkHNddc1uTIbnen4wr-MKJzW4Nndr228k9_YJKDEzPqcmyoKJzWUdIIFQxS6yx2H_Vo0vb3Md16IV2bS6MOiM7BussJiLawBue4emJ_at22jmdhnfZpAmSwS7p9CmcJ1qvk4tfCa30xRqPpSMnNjjW8oERNN-_HrMEZPvuC93atwQt7OCHvfpJOPwHdMIv0rJxW6KGUZj5xaGyhLIpDiZYKSsmFjBGH8VyZUguaIhsooqQNVYdSSs7kkRvKBUPd2M4loWToBbQkhdMyvbvsX5Ym5x6p6n8YSiX4BEqcKHjYVYH38YIgBryCV3TDbSgxHMt5fKuiVxT9PBdgRdFXdsOncw_O4-W9gQDrD_BejuVFv1D-A9m2RbM)

或者

[![](https://mermaid.ink/img/pako:eNqrVkrOT0lVslJKL0osyFAIcYnJUwACx-jSgid7Fzxr6Huys-PF_hlPdvQ-m73l2bQNsQq6unY1z9d2Pt3X-mzqhqcTV9QoOEU_n7Lxya6-530bnq6b97Rv_tPZC542zgFqiAWaFpOnpKOUm1qUm5iZArSnGmRBjFJJRmpuaoySFZCZkpqWWJpTEqMUk1cLVFpakJJYkuqaklmSX6RklZaYU5yqo5RYWpIfXJmXrGRVUlSaClPkkpkIdHYuXFVBYl5Ufj6MXwsAYV9fVg)](https://mermaid.live/edit#pako:eNqrVkrOT0lVslJKL0osyFAIcYnJUwACx-jSgid7Fzxr6Huys-PF_hlPdvQ-m73l2bQNsQq6unY1z9d2Pt3X-mzqhqcTV9QoOEU_n7Lxya6-530bnq6b97Rv_tPZC542zgFqiAWaFpOnpKOUm1qUm5iZArSnGmRBjFJJRmpuaoySFZCZkpqWWJpTEqMUk1cLVFpakJJYkuqaklmSX6RklZaYU5yqo5RYWpIfXJmXrGRVUlSaClPkkpkIdHYuXFVBYl5Ufj6MXwsAYV9fVg)

录播源可以从月频取得，如果决定要协助添加音频，可以私信月月子索要在线录播站，她可能会给你

### 相关工具

ffmpeg : https://github.com/FFmpeg/FFmpeg/releases

jijidown : http://client.jijidown.com/ (右键提取mp3和flv转mp4工具很好用)

SpleeterGUI : https://makenweb.com/SpleeterGUI

mp3DirectCut : https://mpesch3.de/

或者自行百度取得

### LICENSE

- 项目使用**GPL-3.0**为基础开源协议
- 本项目修改自 [Hiiro按钮](https://github.com/blacktunes/hiiro-button) ，原作者 [blacktunes](https://github.com/blacktunes) 
