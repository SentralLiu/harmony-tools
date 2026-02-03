@Entry
@Component
struct Frame {
  @State selectedImage: string = ''
  @State frames: Array<{ id: string, name: string, preview: string }> = [
    { id: 'none', name: '无边框', preview: '' },
    { id: 'white', name: '白色边框', preview: '' },
    { id: 'black', name: '黑色边框', preview: '' },
    { id: 'shadow', name: '阴影边框', preview: '' },
    { id: 'polaroid', name: '拍立得', preview: '' },
    { id: 'vintage', name: '复古边框', preview: '' },
    { id: 'gradient', name: '渐变边框', preview: '' },
    { id: 'ornate', name: '华丽边框', preview: '' }
  ]
  @State selectedFrame: string = 'none'
  @State frameWidth: number = 20

  build() {
    Column() {
      // 顶部导航
      Row() {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .margin({ left: 16 })
          .onClick(() => router.back())
        
        Text('图片加相框')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
        
        Button('保存')
          .fontSize(14)
          .backgroundColor('#4CAF50')
          .onClick(() => {
            // 保存图片
          })
          .enabled(this.selectedImage !== '')
      }
      .height(56)
      .backgroundColor(Color.White)
      .padding({ right: 16 })

      // 主内容
      Column({ space: 16 }) {
        // 图片选择
        if (!this.selectedImage) {
          Column({ space: 16 }) {
            Image($r('app.media.ic_add_photo'))
              .width(64)
              .height(64)
              .onClick(() => {
                // 选择图片
              })
            
            Text('点击选择图片')
              .fontSize(16)
              .fontColor('#666')
          }
          .width('100%')
          .height(200)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .backgroundColor('#F5F5F5')
          .borderRadius(12)
          .margin(16)
        } else {
          // 图片预览
          Stack() {
            // 边框预览
            Column() {
              Image(this.selectedImage)
                .width('100%')
                .borderRadius(4)
            }
            .padding(this.frameWidth)
            .backgroundColor(this.selectedFrame === 'white' ? '#FFF' : 
                            this.selectedFrame === 'black' ? '#000' : 
                            this.selectedFrame === 'shadow' ? '#888' : 'transparent')
            .shadow({
              radius: this.selectedFrame === 'shadow' ? 20 : 0,
              color: '#40000000',
              offsetX: 5,
              offsetY: 5
            })

            // 拍立得效果
            if (this.selectedFrame === 'polaroid') {
              Column()
                .width('100%')
                .height(60)
                .backgroundColor('#FFF')
              .alignItems(HorizontalAlign.Center)
              .justifyContent(FlexAlign.End)
            }

            // 复古/渐变效果
            if (this.selectedFrame === 'vintage') {
              Image(this.selectedImage)
                .width('100%')
                .height('100%')
                .borderRadius(4)
                .opacity(0.8)
              // 这里可以添加复古滤镜效果
            }

            if (this.selectedFrame === 'gradient') {
              Image(this.selectedImage)
                .width('100%')
                .height('100%')
                .borderRadius(4)
            }
          }
          .width('100%')
          .height(350)
          .backgroundColor('#E0E0E0')
          .borderRadius(12)
          .margin(16)
          .onClick(() => {
            // 更换图片
          })

          // 边框宽度设置
          Column({ space: 8 }) {
            Row() {
              Text('边框宽度')
                .fontSize(14)
                .layoutWeight(1)
              Text(this.frameWidth + 'px')
                .fontSize(14)
                .fontColor('#2196F3')
            }
            
            Slider({ value: this.frameWidth, min: 0, max: 100, step: 5 })
              .onChange((value: number) => {
                this.frameWidth = value
              })
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Color.White)
          .borderRadius(12)
        }

        // 边框选择
        Column({ space: 8 }) {
          Text('选择边框样式')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .width('100%')
            .padding({ left: 16 })
          
          Grid() {
            ForEach(this.frames, (frame: any) => {
              GridItem() {
                Column({ space: 4 }) {
                  // 边框预览
                  Column()
                    .width(48)
                    .height(48)
                    .border({
                      width: 4,
                      color: frame.id === 'white' ? '#FFF' : 
                             frame.id === 'black' ? '#000' : 
                             frame.id === 'shadow' ? '#888' : '#DDD',
                      radius: frame.id === 'polaroid' ? 2 : 4
                    })
                    .backgroundColor('#F0F0F0')
                    .shadow({
                      radius: frame.id === 'shadow' ? 10 : 0,
                      color: '#40000000',
                      offsetX: 2,
                      offsetY: 2
                    })
                  // 拍立得底部
                  if (frame.id === 'polaroid') {
                    Column()
                      .width(48)
                      .height(12)
                      .backgroundColor('#FFF')
                  }
                  
                  Text(frame.name)
                    .fontSize(10)
                    .fontColor(this.selectedFrame === frame.id ? '#2196F3' : '#666')
                    .textAlign(TextAlign.Center)
                }
                .onClick(() => {
                  this.selectedFrame = frame.id
                })
                .opacity(this.selectedImage ? 1 : 0.5)
              }
            })
          }
          .columnsTemplate('4fr 4fr 4fr 4fr')
          .columnsGap(8)
          .rowsGap(8)
          .padding(16)
        }
        .width('100%')
        .backgroundColor(Color.White)
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
