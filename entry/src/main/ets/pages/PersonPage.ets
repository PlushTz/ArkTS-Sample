import { Toolbar } from '../views/Toolbar';
/**
 * Desc:
 * @author lijt
 * Created on 2024/3/5
 * Email: lijt@eetrust.com
 */
@Component
export struct PersonPage {
  build() {
    Column() {
      Toolbar({ title: '个人中心', isShowMenu: false })
    }
  }
}