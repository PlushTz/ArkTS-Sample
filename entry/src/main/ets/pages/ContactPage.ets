import { Toolbar } from '../views/Toolbar';
/**
 * Desc:
 * @author lijt
 * Created on 2024/3/5
 * Email: lijt@eetrust.com
 */
@Component
export struct ContactPage {
  build() {
    Column() {
      Toolbar({
        title: '通讯录',
        isShowMenu: false,
        menuIcon: $r('app.media.icon_search')
      })
    }
  }
}