@Entry
@Component
struct Converter {
  @State fromCurrency: string = 'USD'
  @State toCurrency: string = 'CNY'
  @State amount: string = '100'
  @State result: string = ''
  @State currencies: Array<{ code: string, name: string, rate: number }> = [
    { code: 'USD', name: '美元', rate: 7.24 },
    { code: 'CNY', name: '人民币', rate: 1.0 },
    { code: 'EUR', name: '欧元', rate: 7.86 },
    { code: 'GBP', name: '英镑', rate: 9.15 },
    { code: 'JPY', name: '日元', rate: 0.048 },
    { code: 'KRW', name: '韩元', rate: 0.0054 },
    { code: 'HKD', name: '港币', rate: 0.93 },
    { code: 'TWD', name: '台币', rate: 0.23 },
    { code: 'AUD', name: '澳元', rate: 4.72 },
    { code: 'CAD', name: '加元', rate: 5.36 }
  ]

  convert() {
    const fromRate = this.currencies.find(c => c.code === this.fromCurrency)?.rate || 1
    const toRate = this.currencies.find(c => c.code === this.toCurrency)?.rate || 1
    const inputAmount = parseFloat(this.amount) || 0
    const converted = (inputAmount / fromRate) * toRate
    this.result = converted.toFixed(2)
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
        
        Text('汇率转换')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
      }
      .height(56)
      .backgroundColor(Color.White)

      // 主内容
      Column({ space: 24 }) {
        // 金额输入
        Column({ space: 8 }) {
          Text('金额')
            .fontSize(14)
            .fontColor('#666')
            .width('100%')
            .padding({ left: 16 })
          
          TextInput({ placeholder: '请输入金额', text: this.amount })
            .type(InputType.Number)
            .onChange((value: string) => {
              this.amount = value
              this.convert()
            })
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)
        }
        .width('100%')
        .padding(16)

        // 货币选择
        Row({ space: 16 }) {
          Column({ space: 8 }) {
            Text('从')
              .fontSize(14)
              .fontColor('#666')
            
            Button(this.fromCurrency + ' ' + this.currencies.find(c => c.code === this.fromCurrency)?.name)
              .fontSize(16)
              .backgroundColor('#4CAF50')
              .onClick(() => {
                // 显示货币选择器
              })
          }
          .layoutWeight(1)

          Image($r('app.media.ic_arrow_right'))
            .width(32)
            .height(32)

          Column({ space: 8 }) {
            Text('至')
              .fontSize(14)
              .fontColor('#666')
            
            Button(this.toCurrency + ' ' + this.currencies.find(c => c.code === this.toCurrency)?.name)
              .fontSize(16)
              .backgroundColor('#2196F3')
              .onClick(() => {
                // 显示货币选择器
              })
          }
          .layoutWeight(1)
        }
        .width('100%')
        .padding(16)

        // 转换结果
        if (this.result) {
          Column({ space: 8 }) {
            Text('转换结果')
              .fontSize(14)
              .fontColor('#666')
            
            Text(this.amount + ' ' + this.fromCurrency + ' = ' + this.result + ' ' + this.toCurrency)
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#4CAF50')
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Color.White)
          .borderRadius(12)
          .margin(16)
        }
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
