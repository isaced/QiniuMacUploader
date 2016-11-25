# QiniuMacUploader
Mac 平台的七牛云拖拽上传小工具

<img src="https://raw.github.com/isaced/QiniuMacUploader/master/screenshot@2x.png" alt="screenshot" width="540" height="367">

### 开始 🏋

暂时需要自己在 `ViewController.swift` 中配置七牛相关密钥，后面会做成配置项方便灵活使用。

```
let scope = ""
let accessKey = ""
let secretKey = ""
let rootDomain = ""
```

### 感谢 🔨

没有直接使用七牛官方的 SDK，用了 @huhuanming 童鞋写的一个七牛 SDK，支持本地直接生成 token，而且没有其他第三方依赖很清爽。

- [huhuanming/qiniu_upload](https://github.com/huhuanming/qiniu_upload)
