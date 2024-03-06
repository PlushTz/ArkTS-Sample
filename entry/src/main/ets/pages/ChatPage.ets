import router from '@ohos.router';
import Toaster from '../views/Toaster';
import { Toolbar } from '../views/Toolbar';

@Component
export struct Chat {
  build() {
    Column() {
      Toolbar({
        title: '消息',
        isShowMenu: true,
        menuIcon: $r('app.media.icon_search'),
        onMenuClick: () => {
          router.pushUrl({ url: 'pages/Second' })
        }
      })
    }
  }
}