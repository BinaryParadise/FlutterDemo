# Flutter

## 要求

| flutter | xcode   | dart   | 发布日期   |
| ------- | ------- | ------ | ---------- |
| 2.5.3   | 12.0.1+ | 2.14.4 | 2021-10-16 |
| 2.8.1   |         | 2.15.1 | 2021-12-17 |
|         |         |        |            |




## 开发环境搭建

1.下载稳定版flutter SDK并解压到安装目录

```bash
curl https://storage.flutter-io.cn/flutter_infra_release/releases/stable/macos/flutter_macos_2.8.1-stable.zip -O
cd /usr/local
sudo unzip ~/Downloads/flutter_macos_2.8.1-stable.zip
```

2.配置环境变量

```conf
export PATH="$PATH:/usr/local/bin/flutter/bin"
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

## 项目类型

`.metadata`

| project_type | 说明                  |
| ------------ | --------------------- |
| app          | flutter应用           |
| module       | flutter和原生混合开发 |
| package      | dart组件              |
| plugin       | flutter插件           |

## 创建项目

```bash
# 在当前目录创建插件项目
flutter create -t plugin -a java .

# 添加ios平台
flutter create -t plugin --platforms ios .
# 添加Android平台(java语言)
flutter create -t plugin --platforms android -a java .
```



## flutter_boost接入

### 1、dart

```dar
///创建一个自定义的Binding，继承和with的关系如下，里面什么都不用写
class CustomFlutterBinding extends WidgetsFlutterBinding with BoostFlutterBinding {}

void main() {
  ///这里的CustomFlutterBinding调用务必不可缺少，用于控制Boost状态的resume和pause
  CustomFlutterBinding();
  runApp(MyApp());
}
```



## [嵌入原生View-iOS](https://juejin.cn/post/6884954806692085768)

## 发布到pub.dev

```bash
flutter pub publish --server=https://pub.dartlang.org
```

## [Flutter Engine调试](https://juejin.cn/post/6989063428706926605)

### 1、获取源码
```bash
# 创建目录
mkdir flutter_engine
gclient config .
# 修改.gclient内容
 {
    "name": "src/flutter",
    "url": "git@github.com:flutter/engine.git",
}
```

~设置终端代理，否则*chrome-infra-packages.appspot.com*不通~

```bash
export http_proxy=http://127.0.0.1:1087;
export https_proxy=http://127.0.0.1:1087;
```

可能原因: `git`未加入到代理app⚠️

### 2、切换源码到本地flutter sdk的engine版本

```bash
cat /usr/local/flutter/bin/internal/engine.version
git reset --hard xxxx
```