#FXLog
对CocoaLumberjack封装

### CocoaPods 安装
pod FXLog

### 要求
* ARC支持
* iOS 7.0+

### 使用方法

使用前请确认 FXLogger 文件中 ddLogLevel 参数定义是否正确，定义日志级别。

配置方法

```objective-c

1、根据需求修改FXLogger.h文件中的全局日志级别,下面是默认配置，可根据自己需求修改

#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelAll;
#else
static const DDLogLevel ddLogLevel = DDLogLevelError;
#endif
```

配置XcodeColor插件

1、先安装插件XcodeColor  
2、工程中 "Edit Scheme" -> "Run" -> "Arguments" -> "Environment Variables"
添加key：XcodeColors  value:YES
