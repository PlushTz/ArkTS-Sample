/**
 * Desc:
 * @author lijt
 * Created on 2024/3/9
 * Email: lijt@eetrust.com
 */
import { ImageUrl } from '../globle/ImageUrl'
import { ImageMode } from '../mode/ImageMode'

@Entry
@Component
export struct LoginPage {
  private images: ImageMode[] = [
    new ImageMode(0, ImageUrl.URL1),
    new ImageMode(1, ImageUrl.URL2),
    new ImageMode(2, ImageUrl.URL1),
    new ImageMode(3, ImageUrl.URL2),
    new ImageMode(4, ImageUrl.URL1),
    new ImageMode(5, ImageUrl.URL2),
    new ImageMode(6, ImageUrl.URL1),
    new ImageMode(7, ImageUrl.URL2),]
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  build() {
    Column() {
      List({ space: 10 }) {
        ForEach(this.images, (item: ImageMode) => {
          ListItem() {
            Row() {
              if (item.index % 2 === 0) {
                Image(item.url)
                  .width('100%')
                  .borderColor($r('app.color.black'))
                  .objectFit(ImageFit.Contain)
                  .borderRadius(10)
                  .interpolation(ImageInterpolation.High)
              } else {
                Image(item.url)
                  .width('100%')
                  .borderColor($r('app.color.black'))
                  .objectFit(ImageFit.Contain)
                  .borderRadius(10)
                  .interpolation(ImageInterpolation.High)
              }

            }.width('100%').backgroundColor($r('app.color.tab_tv_pressed')).borderRadius(10)
            // Text('' + item)
            //   .width('100%')
            //   .height(100)
            //   .fontSize(16)
            //   .textAlign(TextAlign.Center)
            //   .borderRadius(10)
            //   .backgroundColor(0xFFFFFF)
          }
        })
      }
      .width('95%')
      .height('100%')
      .listDirection(Axis.Vertical) // 排列方向
      // .divider({ strokeWidth: 1, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // 每行之间的分界线
      .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
      .onScrollIndex((firstIndex: number, lastIndex: number) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}