import router from '@ohos.router';
/**
 * Desc:
 * @author lijt
 * Created on 2024/3/5
 * Email: lijt@eetrust.com
 */
@Component
export struct Toolbar {
  title: string;
  menuIcon: Resource;
  isShowMenu: boolean = true;
  isShowBack: boolean = true;
  onMenuClick?: () => void;

  @Builder NavigationMenu(menuIcon: Resource) {
    if (this.isShowMenu) {
      Row() {
        Image(menuIcon).onClick(() => {
          if (this.onMenuClick != undefined) {
            this.onMenuClick()
          }
        }).size({ width: 24, height: 24 })
      }.justifyContent(FlexAlign.End)
    }
  }

  build() {
    Navigation()
      .title(this.title)
      .mode(NavigationMode.Stack)
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(this.isShowBack)
      .width('100%')
      .height(50)
      .menus(this.NavigationMenu($r('app.media.icon_search')))
  }
}