@Entry
@Component
struct MemeMaker {
  @State currentImage: string = ''
  @State canvasPixelMap: any = null
  @State drawColor: string = '#FF0000'
  @State brushSize: number = 5
  @State currentTool: string = 'none' // none, brush, text, sticker
  @State stickers: Array<{ id: number, type: string, content: string, x: number, y: number }> = []
  @State texts: Array<{ id: number, content: string, x: number, y: number, size: number, color: string }> = []
  @State newText: string = ''
  @State stickerCategories: Array<{ name: string, stickers: string[] }> = [
    { name: '表情', stickers: ['😀', '😂', '😍', '😎', '🤔', '😴', '😋', '🥰'] },
    { name: '动物', stickers: ['🐶', '🐱', '🐭', '🦊', '🐻', '🐼', '🐨', '🦁'] },
    { name: '食物', stickers: ['🍕', '🍔', '🍟', '🌭', '🍿', '🧁', '🍩', '🍪'] },
    { name: '符号', stickers: ['🔥', '💯', '👍', '👎', '❤️', '💔', '✨', '🌟'] }
  ]
  @State selectedStickerCategory: number = 0

  aboutToAppear() {
    // 初始化画布
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
        
        Text('表情包制作')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
        
        Button('保存')
          .fontSize(14)
          .backgroundColor('#4CAF50')
          .onClick(() => this.saveMeme())
      }
      .height(56)
      .backgroundColor(Color.White)

      // 主编辑区域
      Stack() {
        // 画布/图片区域
        Column() {
          if (this.currentImage) {
            Image(this.currentImage)
              .width('100%')
              .height('100%')
              .objectFit(ImageFit.Contain)
          } else {
            // 空状态 - 选择图片
            Column({ space: 16 }) {
              Image($r('app.media.ic_add_photo'))
                .width(64)
                .height(64)
                .onClick(() => this.selectImage())
              
              Text('点击选择图片')
                .fontSize(16)
                .fontColor('#666')
            }
            .width('100%')
            .height('100%')
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .backgroundColor('#F5F5F5')
          }

          // 已添加的贴图
          ForEach(this.stickers, (sticker: any) => {
            Text(sticker.content)
              .fontSize(40)
              .position({ x: sticker.x, y: sticker.y })
              .onClick(() => {
                this.stickers = this.stickers.filter(s => s.id !== sticker.id)
              })
          })

          // 已添加的文字
          ForEach(this.texts, (text: any) => {
            Text(text.content)
              .fontSize(text.size)
              .fontColor(text.color)
              .position({ x: text.x, y: text.y })
              .onClick(() => {
                this.texts = this.texts.filter(t => t.id !== text.id)
              })
          })
        }
        .width('100%')
        .height('100%')

        // 画笔绘制层
        if (this.currentTool === 'brush') {
          Column()
            .width('100%')
            .height('100%')
            .onClick((event) => {
              // 画笔绘制逻辑
            })
        }
      }
      .layoutWeight(1)
      .backgroundColor('#1A000000')

      // 工具栏
      Column({ space: 12 }) {
        // 颜色选择器
        if (this.currentTool === 'brush') {
          Row({ space: 8 }) {
            ['#FF0000', '#00FF00', '#0000FF', '#FFFF00', '#FF00FF', '#00FFFF', '#FFFFFF', '#000000'].forEach((color: string) => {
              Circle()
                .width(24)
                .height(24)
                .fill(color)
                .stroke(2, color === '#FFFFFF' ? '#CCC' : 'transparent')
                .onClick(() => this.drawColor = color)
            })
          }
          .padding(8)
          .backgroundColor('#FFF')
          .borderRadius(8)
        }

        // 贴图分类选择
        if (this.currentTool === 'sticker') {
          Row({ space: 8 }) {
            ForEach(this.stickerCategories, (category: any, index: number) => {
              Text(category.name)
                .fontSize(12)
                .padding({ left: 12, right: 12, top: 6, bottom: 6 })
                .backgroundColor(this.selectedStickerCategory === index ? '#2196F3' : '#E0E0E0')
                .fontColor(this.selectedStickerCategory === index ? '#FFF' : '#333')
                .borderRadius(16)
                .onClick(() => this.selectedStickerCategory = index)
            })
          }
          .padding(8)
          .scrollBarOff(true)

          // 贴图列表
          Row({ space: 8 }) {
            ForEach(this.stickerCategories[this.selectedStickerCategory].stickers, (sticker: string) => {
              Text(sticker)
                .fontSize(28)
                .padding(8)
                .backgroundColor('#FFF')
                .borderRadius(8)
                .onClick(() => this.addSticker(sticker))
            })
          }
          .padding(8)
          .backgroundColor('#F5F5F5')
          .scrollBarOff(true)
        }

        // 文字输入
        if (this.currentTool === 'text') {
          Row({ space: 8 }) {
            TextInput({ placeholder: '输入文字', text: this.newText })
              .layoutWeight(1)
              .onChange((value: string) => this.newText = value)
            
            Button('添加')
              .backgroundColor('#2196F3')
              .onClick(() => {
                if (this.newText.trim()) {
                  this.addText(this.newText)
                  this.newText = ''
                }
              })
          }
          .padding(8)
          .backgroundColor('#FFF')
        }

        // 工具按钮
        Row({ space: 16 }) {
          this.toolButton('画笔', 'brush', $r('app.media.ic_brush'), '#FF5722')
          this.toolButton('文字', 'text', $r('app.media.ic_text'), '#9C27B0')
          this.toolButton('贴图', 'sticker', $r('app.media.ic_sticker'), '#4CAF50')
          this.toolButton('清空', 'clear', $r('app.media.ic_clear'), '#F44336')
        }
        .padding(16)
        .backgroundColor(Color.White)
      }
      .backgroundColor('#FFF')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder toolButton(name: string, type: string, icon: Resource, color: string) {
    Column({ space: 4 }) {
      Image(icon)
        .width(28)
        .height(28)
        .fillColor(color)
      
      Text(name)
        .fontSize(10)
        .fontColor(this.currentTool === type ? color : '#666')
    }
    .onClick(() => {
      if (type === 'clear') {
        this.stickers = []
        this.texts = []
      } else {
        this.currentTool = this.currentTool === type ? 'none' : type
      }
    })
  }

  selectImage() {
    // 选择图片
  }

  addSticker(content: string) {
    const sticker = {
      id: Date.now(),
      type: 'sticker',
      content: content,
      x: 100 + Math.random() * 100,
      y: 100 + Math.random() * 100
    }
    this.stickers.push(sticker)
  }

  addText(content: string) {
    const text = {
      id: Date.now(),
      content: content,
      x: 100 + Math.random() * 100,
      y: 100 + Math.random() * 100,
      size: 24,
      color: this.drawColor
    }
    this.texts.push(text)
  }

  saveMeme() {
    // 保存表情包
  }
}
