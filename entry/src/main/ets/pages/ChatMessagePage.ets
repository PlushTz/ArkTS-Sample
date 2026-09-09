/**
 * Desc:
 * @author lijt
 * Created on 2024/6/1
 * Email: lijt@eetrust.com
 */
import { ImageUrl } from '../globle/ImageUrl'

@Preview
@Component
export struct ChatMessagePage {
  build() {
    Column() {
      Row()
      Flex({ direction: FlexDirection.Row }) {
        Image(ImageUrl.URL10)
          .margin({ top: 10, left: 10, bottom: 10, right: 10 })
          .width(50)
          .height(50)
          .borderRadius(5)
          .objectFit(ImageFit.Auto)
        Text('这是一个聊天气泡的布局')
          .fontColor($r('app.color.white'))
          .margin({ top: 10 })
          .padding({ left: 10, top: 10, right: 10, bottom: 10 })
            // .backgroundImage($r('app.media.left_bubble'))
          .backgroundColor($r('app.color.black'))
      }

    }.width('100%').height('100%')
  }
}