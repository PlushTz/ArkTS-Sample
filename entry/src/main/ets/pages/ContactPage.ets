import { Toolbar } from '../common/CommonComponents'
import { ContactListPage } from './ContactListPage'
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
        titleColor:$r('app.color.white'),
        isShowMenu: false,
        titleMode:NavigationTitleMode.Mini,
      }).height(50).backgroundColor($r('app.color.black'))
      ContactListPage()
    }
    .width('100%')
    .height('100%')
  }
}