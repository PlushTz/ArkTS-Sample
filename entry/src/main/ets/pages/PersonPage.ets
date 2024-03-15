import { Toolbar } from '../common/CommonComponents';
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
      Toolbar({
        title: '个人中心',
        titleColor: $r('app.color.white'),
        titleMode: NavigationTitleMode.Mini
      }).height(50).backgroundColor($r('app.color.black'))

    }.width('100%')
    .height('100%')
  }
}