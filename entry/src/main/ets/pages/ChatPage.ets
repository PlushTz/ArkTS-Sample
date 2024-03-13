import router from '@ohos.router'
import Toaster from '../views/Toaster'
import { Toolbar } from '../common/CommonComponents'
import { ListPage } from '../pages/ListPage'
import { ImageMode } from '../mode/ImageMode'
import List from '@ohos.util.List'
import { ImageUrl } from '../globle/ImageUrl'

@Preview
@Component
export struct Chat {
  private data: Array<ImageMode> = [
    new ImageMode(0, ImageUrl.URL1),
    new ImageMode(1, ImageUrl.URL2),
    new ImageMode(2, ImageUrl.URL1),
    new ImageMode(3, ImageUrl.URL2),
    new ImageMode(4, ImageUrl.URL1),
    new ImageMode(5, ImageUrl.URL2),
    new ImageMode(6, ImageUrl.URL1),
    new ImageMode(7, ImageUrl.URL2)
  ]

  build() {
    Column() {
      Toolbar({
        title: '消息',
        isShowMenu: true,
        menuIcon: $r('app.media.icon_search'),
        onMenuClick: () => {
          router.pushUrl({ url: 'pages/LoginPage' })
        }
      })
      ListPage({ data: this.data, onItemClick: (item) => {
        console.log(item.index.toString() + ',' + item.url)
      } }).width('100%').layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.white'))
  }
}