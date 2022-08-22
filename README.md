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

`locales.json`和`category.json`分别为 UI 界面翻译和分类信息，请**不要修改**

请新建`json`文件，注意文件名一致，例：`02_voices_22.08.22.json`

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

### LICENSE

- 项目使用**GPL-3.0**为基础开源协议
- 本项目修改自 [Hiiro按钮](https://github.com/blacktunes/hiiro-button) ，原作者 [blacktunes](https://github.com/blacktunes) 
