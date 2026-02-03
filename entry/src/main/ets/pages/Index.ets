@Extend(Text) function featureTitle() {
  .fontSize(14)
  .fontWeight(FontWeight.Medium)
  .textAlign(TextAlign.Center)
  .width('100%')
  .margin({ top: 8 })
}

@Extend(Image) function featureIcon(size: number) {
  .width(size)
  .height(size)
  .objectImage(ImageFit.Contain)
}

@Extend(Column) function featureCard() {
  .width(160)
  .height(120)
  .backgroundColor(Color.White)
  .borderRadius(16)
  .justifyContent(FlexAlign.Center)
  .alignItems(HorizontalAlign.Center)
  .shadow({ radius: 8, color: '#20000000', offsetX: 2, offsetY: 4 })
}

@Entry
@Component
struct Index {
  @State features: Array<{
    name: string,
    icon: Resource,
    page: string,
    description: string,
    color: string
  }> = [
    {
      name: '汇率转换',
      icon: $r('app.media.ic_converter'),
      page: 'pages/Converter',
      description: '多币种实时汇率',
      color: '#4CAF50'
    },
    {
      name: '尺子',
      icon: $r('app.media.ic_ruler'),
      page: 'pages/Ruler',
      description: '精准测量工具',
      color: '#2196F3'
    },
    {
      name: '镜子',
      icon: $r('app.media.ic_mirror'),
      page: 'pages/Mirror',
      description: '前置摄像头镜像',
      color: '#9C27B0'
    },
    {
      name: '图片拼接',
      icon: $r('app.media.ic_stitch'),
      page: 'pages/Stitch',
      description: '多图横向纵向拼接',
      color: '#FF9800'
    },
    {
      name: '短视频转GIF',
      icon: $r('app.media.ic_gif'),
      page: 'pages/Gif',
      description: '视频转动态图片',
      color: '#E91E63'
    },
    {
      name: '图片加相框',
      icon: $r('app.media.ic_frame'),
      page: 'pages/Frame',
      description: '边框相框装饰',
      color: '#795548'
    },
    {
      name: '表情包制作',
      icon: $r('app.media.ic_meme'),
      page: 'pages/MemeMaker',
      description: '贴图文字画笔',
      color: '#FF5722'
    },
    {
      name: '关于',
      icon: $r('app.media.ic_about'),
      page: 'pages/About',
      description: '应用信息',
      color: '#607D8B'
    }
  ]

  build() {
    Column() {
      // 顶部标题栏
      Row() {
        Text('鸿蒙工具箱')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333')
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor(Color.White)

      // 功能网格
      Grid() {
        ForEach(this.features, (item: any) => {
          GridItem() {
            Column() {
              Column()
                .width(56)
                .height(56)
                .borderRadius(28)
                .backgroundColor(item.color)
                .justifyContent(FlexAlign.Center)
                .alignItems(HorizontalAlign.Center) {
                  Image(item.icon)
                    .featureIcon(28)
                    .fillColor(Color.White)
                }

              Text(item.name)
                .featureTitle()
                .fontColor('#333')

              Text(item.description)
                .fontSize(12)
                .fontColor('#999')
                .textAlign(TextAlign.Center)
                .width('100%')
                .margin({ top: 4 })
            }
            .featureCard()
            .onClick(() => {
              router.pushUrl({ url: item.page })
            })
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr')
      .columnsGap(12)
      .rowsGap(12)
      .padding(16)
      .layoutWeight(1)

      // 底部版本信息
      Text('v1.0.0 • 可扩展架构设计')
        .fontSize(12)
        .fontColor('#999')
        .padding(16)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
