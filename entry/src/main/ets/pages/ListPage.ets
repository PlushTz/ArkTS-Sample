/**
 * Desc:
 * @author lijt
 * Created on 2024/3/13
 * Email: lijt@eetrust.com
 */
import { ImageMode } from '../mode/ImageMode'
import { ImageUrl } from '../globle/ImageUrl'

@Styles function downBackgroundColor() {
  .backgroundColor($r('app.color.tab_tv_normal'))
}

@Styles function upBackgroundColor() {
  .backgroundColor($r('app.color.white'))
}

@Component
export struct ListPage {
  data: Array<ImageMode> = []
  onItemClick?: (item: ImageMode) => void

  build() {
    Column() {
      List({ space: 10 }) {
        ForEach(this.data, (item: ImageMode) => {
          ListItem() {
            Row() {
              if (item.index % 2 === 0) {
                Image(item.url)
                  .width('100%')
                  .borderColor($r('app.color.black'))
                  .objectFit(ImageFit.Contain)
                  .borderRadius(10)
                  .interpolation(ImageInterpolation.High)
                  .onClick(() => {

                  })
              } else {
                Image(item.url)
                  .width('100%')
                  .borderColor($r('app.color.black'))
                  .objectFit(ImageFit.Contain)
                  .borderRadius(10)
                  .interpolation(ImageInterpolation.High)
              }
            }
            .width('100%')
            .borderRadius(10)
          }.onClick(() => {
            if (this.onItemClick != null && this.onItemClick != undefined) {
              this.onItemClick(item)
            }
          }).onTouch((event) => {
            switch (event.type) {
              case TouchType.Down:
                console.log('按下了')
                break
              case TouchType.Up:
                console.log('抬起来了')
                break
            }
          })
        })
      }
      .width('95%')
      .height('100%')
      .listDirection(Axis.Vertical) // 排列方向
      .divider({ strokeWidth: 1, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // 每行之间的分界线
      .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
      .onScrollIndex((firstIndex: number, lastIndex: number) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
      })
    }
    .width('100%')
    .height('100%')
    .padding({ top: 5 })
  }
}