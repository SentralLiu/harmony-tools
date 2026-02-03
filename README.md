# HarmonyTools - 鸿蒙工具箱

[![HarmonyOS](https://img.shields.io/badge/HarmonyOS-5.0+-blue.svg)](https://www.harmonyos.com)
[![ArkTS](https://img.shields.io/badge/ArkTS-3.x-green.svg)](https://developer.harmonyos.com)

一款功能丰富的鸿蒙(HarmonyOS)工具应用，提供汇率转换、尺子、镜子、图片拼接、短视频转GIF、图片加相框等实用功能。

## ✨ 功能特性

### 已实现功能
- 📱 **汇率转换** - 多币种实时汇率查询
- 📏 **尺子** - 精准屏幕测量工具，支持校准
- 🪞 **镜子** - 前置摄像头镜像，支持美颜滤镜
- 🖼️ **图片拼接** - 多图横向/纵向/网格拼接
- 🎬 **短视频转GIF** - 视频转动态图片，支持参数调节
- 🖼️ **图片加相框** - 多种边框样式可选

### 可扩展设计
- 🏗️ **模块化架构** - 新功能轻松添加
- 📐 **统一设计语言** - 一致的用户体验
- 🔌 **插件式扩展** - 热插拔功能模块
- 🎨 **主题支持** - 后续可添加主题切换

## 📁 项目结构

```
harmony-tools/
├── harmony/
│   ├── entry/                  # 主模块
│   │   └── src/main/ets/
│   │       ├── entryability/   # 应用入口
│   │       ├── global/         # 全局配置
│   │       └── pages/          # 页面
│   │           ├── Index.ets           # 首页
│   │           ├── Converter.ets       # 汇率转换
│   │           ├── Ruler.ets           # 尺子
│   │           ├── Mirror.ets          # 镜子
│   │           ├── Stitch.ets          # 图片拼接
│   │           ├── Gif.ets             # 视频转GIF
│   │           ├── Frame.ets           # 图片加相框
│   │           └── About.ets           # 关于
│   │
│   ├── common/                 # 公共模块
│   │   └── src/main/ets/
│   │       ├── components/     # 公共组件
│   │       └── utils/          # 工具函数
│   │           ├── FeatureManager.ets  # 模块管理
│   │           └── Utils.ets           # 常用工具
│   │
│   └── features/               # 功能模块（可扩展）
│       ├── converter/          # 汇率转换模块
│       ├── ruler/              # 尺子模块
│       ├── mirror/             # 镜子模块
│       ├── stitch/             # 图片拼接模块
│       ├── gif/                # GIF转换模块
│       └── frame/              # 相框模块
│
├── resources/
│   ├── base/                   # 基础资源
│   │   ├── element/            # 元素资源（颜色、字符串）
│   │   ├── media/              # 媒体资源（图片、图标）
│   │   ├── layout/             # 布局资源
│   │   └── profile/            # 配置文件
│   └── rawfile/                # 原始文件
│
└── module.json5                # 模块配置
```

## 🚀 快速开始

### 环境要求
- HarmonyOS SDK 5.0+
- DevEco Studio 4.0+
- ArkTS 3.x

### 安装步骤
1. 克隆项目
```bash
git clone https://github.com/SentralLiu/harmony-tools.git
```

2. 用 DevEco Studio 打开项目
3. 连接真机或模拟器
4. 点击「Build > Build HAP(s)」
5. 点击「Run」运行

### 添加新功能
1. 在 `features/` 目录下创建新模块文件夹
2. 继承 `BaseFeature` 类实现功能
3. 在 `FeatureRegistry` 中注册新功能
4. 更新首页导航

```typescript
// 示例：添加计算器功能
import { BaseFeature, FeatureRegistry } from '../utils/FeatureManager'

class CalculatorFeature extends BaseFeature {
  getName() { return 'calculator' }
  getDescription() { return 'Calculator tool' }
}

// 注册功能
FeatureRegistry.getInstance().register(new CalculatorFeature())
```

## 📱 页面预览

| 首页 | 汇率转换 | 尺子 |
|:---:|:---:|:---:|
| ![Home](docs/images/home.png) | ![Converter](docs/images/converter.png) | ![Ruler](docs/images/ruler.png) |

## 🛠️ 技术栈

- **框架**: HarmonyOS ArkUI
- **语言**: ArkTS
- **UI**: 声明式UI、组件化开发
- **架构**: MVVM + 模块化

## 📝 权限配置

应用使用到的权限：
```json
{
  "requestPermissions": [
    { "name": "ohos.permission.CAMERA" },
    { "name": "ohos.permission.WRITE_MEDIA" },
    { "name": "ohos.permission.READ_MEDIA" },
    { "name": "ohos.permission.INTERNET" }
  ]
}
```

## 🤝 贡献指南

欢迎提交 Issue 和 Pull Request！

1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/amazing-feature`)
3. 提交改动 (`git commit -m 'Add amazing feature'`)
4. 推送分支 (`git push origin feature/amazing-feature`)
5. 开启 Pull Request

## 📄 许可证

MIT License - 详见 [LICENSE](LICENSE)

## 👤 作者

**SentralLiu**

- GitHub: [@SentralLiu](https://github.com/SentralLiu)
- Email: sentralliu@github.com

---

⭐ 如果对你有帮助，请给项目点个 Star！
