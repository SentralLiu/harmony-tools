@Entry
@Component
struct Ruler {
  @State screenWidth: number = 0
  @State pixelsPerMm: number = 3.7795
  @State currentLength: number = 0
  @State unit: string = 'mm'
  @State isCalibrating: boolean = false
  @State calibrationValue: number = 100

  aboutToAppear() {
    // 获取屏幕宽度像素
    display.getDefaultDisplay().then((displayInfo) => {
      this.screenWidth = displayInfo.width
      this.pixelsPerMm = displayInfo.width / 1080 * 3.7795
    })
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
        
        Text('尺子')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
        
        Button(this.isCalibrating ? '完成校准' : '校准')
          .fontSize(14)
          .backgroundColor(this.isCalibrating ? '#4CAF50' : '#2196F3')
          .onClick(() => {
            if (this.isCalibrating) {
              this.pixelsPerMm = this.screenWidth / this.calibrationValue
              this.isCalibrating = false
            } else {
              this.isCalibrating = true
            }
          })
      }
      .height(56)
      .backgroundColor(Color.White)
      .padding({ right: 16 })

      // 尺子主体
      Column() {
        // 刻度尺
        Scroll() {
          Row() {
            ForEach(Array.from({ length: Math.ceil(this.screenWidth / this.pixelsPerMm) + 50 }, (_, i) => i), (index: number) => {
              Column() {
                if (index % 10 === 0) {
                  Rect()
                    .width(2)
                    .height(40)
                    .fill('#333')
                  Text((index / 10).toString())
                    .fontSize(12)
                    .fontColor('#333')
                    .margin({ top: 4 })
                } else if (index % 5 === 0) {
                  Rect()
                    .width(2)
                    .height(24)
                    .fill('#666')
                } else {
                  Rect()
                    .width(1)
                    .height(12)
                    .fill('#999')
                }
              }
              .width(this.pixelsPerMm)
              .alignItems(HorizontalAlign.Center)
            })
          }
          .height(80)
          .alignItems(VerticalAlign.Top)
        }
        .scrollBarOff(true)
        .edgeEffect(EdgeEffect.None)

        // 当前测量值
        Column({ space: 8 }) {
          Text((this.currentLength / (this.unit === 'mm' ? 1 : this.pixelsPerMm)).toFixed(1))
            .fontSize(48)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2196F3')
          
          Text(this.unit === 'mm' ? '毫米' : '像素')
            .fontSize(16)
            .fontColor('#666')
        }
        .margin({ top: 24 })
      }
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)

      // 单位切换
      Row({ space: 16 }) {
        Button('毫米 (mm)')
          .fontSize(16)
          .backgroundColor(this.unit === 'mm' ? '#2196F3' : '#E0E0E0')
          .onClick(() => this.unit = 'mm')
        
        Button('像素 (px)')
          .fontSize(16)
          .backgroundColor(this.unit === 'px' ? '#2196F3' : '#E0E0E0')
          .onClick(() => this.unit = 'px')
      }
      .padding(16)
      .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
