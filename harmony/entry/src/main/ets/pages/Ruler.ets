@Entry
@Component
struct Ruler {
  @State screenWidth: number = 0
  @State pixelsPerMm: number = 3.7795 // 约 96 DPI / 25.4
  @State currentLength: number = 0
  @State unit: string = 'mm'
  @State isCalibrating: boolean = false
  @State calibrationValue: number = 100

  aboutToAppear() {
    // 获取屏幕宽度像素
    display.getDefaultDisplay().then((displayInfo) => {
      this.screenWidth = displayInfo.width
      this.pixelsPerMm = displayInfo.width / 1080 * 3.7795 // 基准 1080p
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
          Column() {
            Row() {
              ForEach(Array.from({ length: Math.ceil(this.screenWidth / this.pixelsPerMm) + 50 }, (_, i) => i), (index: number) => {
                Column() {
                  if (index % 10 === 0) {
                    // 大刻度 (1cm)
                    Rect()
                      .width(2)
                      .height(40)
                      .fill('#333')
                    Text((index / 10).toString())
                      .fontSize(12)
                      .fontColor('#333')
                      .margin({ top: 4 })
                  } else if (index % 5 === 0) {
                    // 中刻度 (5mm)
                    Rect()
                      .width(2)
                      .height(24)
                      .fill('#666')
                  } else {
                    // 小刻度 (1mm)
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
          .width(this.screenWidth + 100)
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

      // 校准说明
      if (this.isCalibrating) {
        Column({ space: 8 }) {
          Text('校准说明')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
          
          Text('请输入你知道的实际物体宽度（如银行卡、身份证）进行校准')
            .fontSize(12)
            .fontColor('#666')
            .textAlign(TextAlign.Center)
          
          TextInput({ placeholder: '请输入宽度 (mm)', text: this.calibrationValue.toString() })
            .type(InputType.Number)
            .onChange((value: string) => {
              this.calibrationValue = parseFloat(value) || 100
            })
            .padding(12)
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#FFF3E0')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
