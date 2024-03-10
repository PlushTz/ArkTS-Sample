import { ImageUrl } from '../globle/ImageUrl'

@Preview
@Entry
@Component
struct ImagePage {
  scroller: Scroller = new Scroller()
  @State message: string = 'Hello World'

  build() {
    Scroll(this.scroller) {
      Column() {
        Image($r('app.media.icon'))
          .width(250)
          .borderRadius(10)
          .margin({ top: 10 })
          .objectFit(ImageFit.Auto)
          .interpolation(ImageInterpolation.High) // 设置图片插值效果
        Image(ImageUrl.URL1)
          .borderRadius(10)
          .width('100%')
          .objectFit(ImageFit.Contain)
          .margin({ top: 10, left: 10, right: 10 })
          .overlay('Contain', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })

        Image(ImageUrl.URL2)
          .width('100%')
          .borderRadius(10)
          .margin({ top: 10, left: 10, right: 10 })
          .objectFit(ImageFit.Auto)

        Image(ImageUrl.URL1)
          .width('100%')
          .borderRadius(10)
          .margin({ top: 10, left: 10, right: 10 })
          .objectFit(ImageFit.Fill)

        Image(ImageUrl.URL2)
          .width('100%')
          .borderRadius(10)
          .margin({ top: 10, left: 10, right: 10, bottom: 5 })
          .objectFit(ImageFit.Cover)
          .overlay('Cover', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })

      }
    }
  }
}