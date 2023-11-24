@Entry
@Component
struct Index {

  @State
  message: string = '我的模块1中缺省页'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }

}