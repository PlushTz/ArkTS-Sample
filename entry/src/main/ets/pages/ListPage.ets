/**
 * Desc:
 * @author lijt
 * Created on 2024/3/13
 * Email: lijt@eetrust.com
 */
import { ConversationMode } from '../mode/ConversationMode'
import { ImageMode } from '../mode/ImageMode'

@Styles function downBackgroundColor() {
  .backgroundColor($r('app.color.tab_tv_normal'))
}

@Styles function upBackgroundColor() {
  .backgroundColor($r('app.color.white'))
}

@Component
export struct ListPage {
  data: Array<ConversationMode> = []
  onItemClick?: (item: ConversationMode) => void

  build() {
    Column() {
      List() {
        ForEach(this.data, (item: ConversationMode) => {
          ListItem() {
            this.ConversationItem(item)
          }.onClick(() => {
            if (this.onItemClick != null && this.onItemClick != undefined) {
              this.onItemClick(item)
            }
          })
        })
      }
      .width('100%')
      .height('100%')
      .listDirection(Axis.Vertical) // 排列方向
      .divider({ strokeWidth: 0.1, color: $r('app.color.tab_tv_normal'), startMargin: 70 }) // 每行之间的分界线
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

  @Builder ConversationItem(item: ConversationMode) {
    Row() {
      Stack() {
        Image(item.avatar)
          .width(50)
          .height(50)
          .borderRadius(5)
          .objectFit(ImageFit.Auto)
      }
      .margin({ left: 10, right: 10 })
      .alignContent(Alignment.Center)

      Column() {
        Row() {
          Text(item.title)
            .width('100')
            .fontSize(16)
            .fontColor($r('app.color.black'))
            .layoutWeight(1)
            .align(Alignment.Center)
          Text(item.date)
            .width(50)
            .fontSize(12)
            .fontColor($r('app.color.tab_tv_normal'))
            .align(Alignment.Center)
        }.width('100%')
        .layoutWeight(1)

        Row() {
          Text(item.previewMsg)
            .fontSize(13)
            .fontColor($r('app.color.tab_tv_normal'))
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .align(Alignment.Center)
            .layoutWeight(1)
          Blank().width(50)
        }
        .width('100%')
        .layoutWeight(1)
      }.layoutWeight(1)
      .align(Alignment.Center)
      .height(50)
    }.width('100%')
    .height(60)
  }
}