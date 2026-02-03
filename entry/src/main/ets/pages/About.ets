@Entry
@Component
struct About {
  build() {
    Column() {
      // 顶部导航
      Row() {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .margin({ left: 16 })
          .onClick(() => router.back())
        
        Text('关于')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
      }
      .height(56)
      .backgroundColor(Color.White)

      Scroll() {
        Column({ space: 24 }) {
          // 应用信息
          Column({ space: 8 }) {
            Image($r('app.media.ic_launcher'))
              .width(80)
              .height(80)
              .borderRadius(16)
            
            Text('鸿蒙工具箱')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
            
            Text('Version 1.0.0')
              .fontSize(14)
              .fontColor('#999')
          }
          .width('100%')
          .padding(32)
          .alignItems(HorizontalAlign.Center)

          // 功能介绍
          Column({ space: 12 }) {
            Text('功能介绍')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .padding({ left: 16 })
            
            this.featureItem('汇率转换', '多币种实时汇率查询', '#4CAF50')
            this.featureItem('尺子', '精准屏幕测量工具', '#2196F3')
            this.featureItem('镜子', '前置摄像头镜像', '#9C27B0')
            this.featureItem('图片拼接', '多图横向纵向拼接', '#FF9800')
            this.featureItem('短视频转GIF', '视频转动态图片', '#E91E63')
            this.featureItem('图片加相框', '边框相框装饰', '#795548')
            this.featureItem('表情包制作', '贴图文字画笔', '#FF5722')
          }
          .width('100%')
          .backgroundColor(Color.White)

          // 关于内容
          Column({ space: 12 }) {
            Text('关于应用')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .padding({ left: 16 })
            
            Text('鸿蒙工具箱是一款功能丰富的日常工具应用，采用模块化设计，支持功能扩展。')
              .fontSize(14)
              .fontColor('#666')
              .width('100%')
              .padding(16)
          }
          .width('100%')
          .backgroundColor(Color.White)

          // 扩展说明
          Column({ space: 12 }) {
            Text('可扩展设计')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .padding({ left: 16 })
            
            Text('• 模块化架构，易于添加新功能\n• 统一的页面风格和交互规范\n• 组件复用，减少重复代码\n• 支持主题切换和个性化设置')
              .fontSize(14)
              .fontColor('#666')
              .width('100%')
              .padding(16)
          }
          .width('100%')
          .backgroundColor(Color.White)

          Text('© 2026 SentralLiu. MIT License.')
            .fontSize(12)
            .fontColor('#999')
            .padding(32)
        }
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder featureItem(name: string, desc: string, color: string) {
    Row({ space: 12 }) {
      Circle()
        .width(8)
        .height(8)
        .fill(color)
      
      Text(name)
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .layoutWeight(1)
      
      Text(desc)
        .fontSize(12)
        .fontColor('#999')
    }
    .width('100%')
    .padding({ left: 16, right: 16, top: 8, bottom: 8 })
  }
}
