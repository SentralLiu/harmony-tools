@Entry
@Component
struct Gif {
  @State selectedVideo: string = ''
  @State isProcessing: boolean = false
  @State progress: number = 0
  @State gifResult: string = ''
  @State gifSettings: {
    fps: number,
    width: number,
    startTime: number,
    duration: number
  } = {
    fps: 10,
    width: 480,
    startTime: 0,
    duration: 3
  }

  build() {
    Column() {
      // 顶部导航
      Row() {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .margin({ left: 16 })
          .onClick(() => router.back())
        
        Text('短视频转GIF')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
      }
      .height(56)
      .backgroundColor(Color.White)

      // 主内容
      Scroll() {
        Column({ space: 16 }) {
          // 视频选择区域
          if (!this.selectedVideo) {
            Column({ space: 16 }) {
              Image($r('app.media.ic_video'))
                .width(64)
                .height(64)
                .onClick(() => {
                  // 选择视频
                })
              
              Text('点击选择短视频')
                .fontSize(16)
                .fontColor('#666')
              
              Text('支持 MP4、AVI、MOV 格式')
                .fontSize(12)
                .fontColor('#999')
            }
            .width('100%')
            .height(200)
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .backgroundColor('#F5F5F5')
            .borderRadius(12)
            .margin(16)
          } else {
            // 已选择视频
            Column({ space: 8 }) {
              Row() {
                Image($r('app.media.ic_video'))
                  .width(24)
                  .height(24)
                
                Text('已选择视频')
                  .fontSize(14)
                  .layoutWeight(1)
                
                Button('更换')
                  .fontSize(12)
                  .backgroundColor('#2196F3')
                  .onClick(() => {
                    this.selectedVideo = ''
                    this.gifResult = ''
                  })
              }
              .padding(16)
              
              // 视频预览
              Text('视频预览区域')
                .width('100%')
                .height(200)
                .backgroundColor('#000')
                .borderRadius(12)
                .textAlign(TextAlign.Center)
                .fontColor('#FFF')
            }
            .width('100%')
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)
            .margin(16)
          }

          // GIF 设置
          if (this.selectedVideo && !this.gifResult) {
            Column({ space: 16 }) {
              Text('GIF 设置')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .width('100%')
                .padding({ left: 16 })
              
              // FPS 设置
              Column({ space: 8 }) {
                Row() {
                  Text('帧率 (FPS)')
                    .fontSize(14)
                    .layoutWeight(1)
                  Text(this.gifSettings.fps.toString())
                    .fontSize(14)
                    .fontColor('#2196F3')
                }
                
                Slider({ value: this.gifSettings.fps, min: 5, max: 30, step: 1 })
                  .onChange((value: number) => {
                    this.gifSettings.fps = value
                  })
              }
              .width('100%')
              .padding(16)
              .backgroundColor(Color.White)
              .borderRadius(12)

              // 宽度设置
              Column({ space: 8 }) {
                Row() {
                  Text('输出宽度')
                    .fontSize(14)
                    .layoutWeight(1)
                  Text(this.gifSettings.width + 'px')
                    .fontSize(14)
                    .fontColor('#2196F3')
                }
                
                Slider({ value: this.gifSettings.width, min: 240, max: 720, step: 48 })
                  .onChange((value: number) => {
                    this.gifSettings.width = value
                  })
              }
              .width('100%')
              .padding(16)
              .backgroundColor(Color.White)
              .borderRadius(12)

              // 时长设置
              Column({ space: 8 }) {
                Row() {
                  Text('GIF 时长')
                    .fontSize(14)
                    .layoutWeight(1)
                  Text(this.gifSettings.duration + '秒')
                    .fontSize(14)
                    .fontColor('#2196F3')
                }
                
                Slider({ value: this.gifSettings.duration, min: 1, max: 10, step: 1 })
                  .onChange((value: number) => {
                    this.gifSettings.duration = value
                  })
              }
              .width('100%')
              .padding(16)
              .backgroundColor(Color.White)
              .borderRadius(12)

              // 转换按钮
              Button(this.isProcessing ? '转换中 ' + this.progress + '%' : '开始转换')
                .fontSize(16)
                .backgroundColor('#4CAF50')
                .width('100%')
                .onClick(() => {
                  this.isProcessing = true
                  // 模拟转换过程
                  let timer = setInterval(() => {
                    this.progress += 10
                    if (this.progress >= 100) {
                      clearInterval(timer)
                      this.isProcessing = false
                      this.progress = 0
                      this.gifResult = '生成成功'
                    }
                  }, 500)
                })
                .enabled(!this.isProcessing)
            }
            .width('100%')
            .padding(16)
          }

          // GIF 预览
          if (this.gifResult) {
            Column({ space: 8 }) {
              Text('转换结果')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .width('100%')
                .padding({ left: 16 })
              
              Text('GIF 预览区域')
                .width('100%')
                .height(300)
                .backgroundColor('#F5F5F5')
                .borderRadius(12)
                .textAlign(TextAlign.Center)
                .fontColor('#666')
              
              Row({ space: 16 }) {
                Button('保存到相册')
                  .fontSize(14)
                  .backgroundColor('#4CAF50')
                  .layoutWeight(1)
                
                Button('分享')
                  .fontSize(14)
                  .backgroundColor('#2196F3')
                  .layoutWeight(1)
              }
              .padding(16)
            }
            .width('100%')
            .padding(16)
          }
        }
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
