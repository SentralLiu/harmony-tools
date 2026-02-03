@Entry
@Component
struct Stitch {
  @State images: Array<string> = []
  @State stitchMode: string = 'horizontal'
  @State columns: number = 2
  @State gap: number = 4

  build() {
    Column() {
      // 顶部导航
      Row() {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .margin({ left: 16 })
          .onClick(() => router.back())
        
        Text('图片拼接')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
        
        Button('保存')
          .fontSize(14)
          .backgroundColor('#4CAF50')
          .enabled(this.images.length > 0)
      }
      .height(56)
      .backgroundColor(Color.White)
      .padding({ right: 16 })

      // 拼接模式选择
      Row({ space: 12 }) {
        Button('横向')
          .fontSize(12)
          .backgroundColor(this.stitchMode === 'horizontal' ? '#2196F3' : '#E0E0E0')
          .onClick(() => this.stitchMode = 'horizontal')
        
        Button('纵向')
          .fontSize(12)
          .backgroundColor(this.stitchMode === 'vertical' ? '#2196F3' : '#E0E0E0')
          .onClick(() => this.stitchMode = 'vertical')
        
        Button('网格')
          .fontSize(12)
          .backgroundColor(this.stitchMode === 'grid' ? '#2196F3' : '#E0E0E0')
          .onClick(() => this.stitchMode = 'grid')
      }
      .padding(16)
      .backgroundColor(Color.White)

      // 预览区域
      Scroll() {
        Column() {
          if (this.images.length === 0) {
            Column({ space: 16 }) {
              Image($r('app.media.ic_add_photo'))
                .width(64)
                .height(64)
              
              Text('点击添加图片')
                .fontSize(16)
                .fontColor('#999')
              
              Text('最多支持9张图片拼接')
                .fontSize(12)
                .fontColor('#CCC')
            }
            .width('100%')
            .height(300)
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .backgroundColor('#F5F5F5')
            .borderRadius(12)
            .margin(16)
          } else {
            if (this.stitchMode === 'horizontal') {
              Row({ space: this.gap }) {
                ForEach(this.images, (url: string) => {
                  Image(url)
                    .width(100)
                    .height(100)
                    .objectFit(ImageFit.Cover)
                    .borderRadius(8)
                })
              }
              .scrollBarOff(true)
              .padding(16)
            } else if (this.stitchMode === 'vertical') {
              Column({ space: this.gap }) {
                ForEach(this.images, (url: string) => {
                  Image(url)
                    .width('100%')
                    .height(100)
                    .objectFit(ImageFit.Cover)
                    .borderRadius(8)
                })
              }
              .padding(16)
            } else {
              Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start, alignContent: FlexAlign.Start }) {
                ForEach(this.images, (url: string) => {
                  Image(url)
                    .width((100 / this.columns) + '%')
                    .aspectRatio(1)
                    .objectFit(ImageFit.Cover)
                    .borderRadius(4)
                })
              }
              .padding(16)
            }
          }
        }
      }
      .layoutWeight(1)

      // 底部工具栏
      Row({ space: 16 }) {
        Button('添加图片')
          .fontSize(16)
          .backgroundColor('#2196F3')
          .layoutWeight(1)
        
        Button('清空')
          .fontSize(16)
          .backgroundColor('#FF5722')
          .onClick(() => { this.images = [] })
          .enabled(this.images.length > 0)
          .layoutWeight(1)
      }
      .padding(16)
      .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
