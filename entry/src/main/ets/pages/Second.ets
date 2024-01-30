@Entry
@Component
struct Second {
  build() {
    Column() {
      Image('https://ts1.cn.mm.bing.net/th/id/R-C.66d7b796377883a92aad65b283ef1f84?rik=sQ%2fKoYAcr%2bOwsw&riu=http%3a%2f%2fwww.quazero.com%2fuploads%2fallimg%2f140305%2f1-140305131415.jpg&ehk=Hxl%2fQ9pbEiuuybrGWTEPJOhvrFK9C3vyCcWicooXfNE%3d&risl=&pid=ImgRaw&r=0')
        .width('100%')
        .height('50%')
    }.backgroundColor($r('app.color.DarkSlateBlue'))
    .width('100%')
    .height('100%')
  }
}