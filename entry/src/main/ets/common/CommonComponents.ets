/**
 * Desc:
 * @author lijt
 * Created on 2024/3/5
 * Email: lijt@eetrust.com
 */
@Preview
@Component
export struct Toolbar {
  title?: string
  titleColor?: Resource
  menuIcon?: Resource
  isShowMenu?: boolean = true
  isShowBack?: boolean = true
  onMenuClick?: () => void
  titleMode?: NavigationTitleMode
  mode?: NavigationMode

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

  @Builder CustomTitle(title: ResourceStr, titleColor: ResourceStr) {
    Row() {
      Text(title).fontColor(titleColor).fontSize(18)
        .width('100%')
        .align(Alignment.Center)
    }.width('100%')
    .height(50)
  }

  build() {
    Navigation()
      .title(this.CustomTitle(this.title, this.titleColor))
      .mode(this.mode)
      .titleMode(this.titleMode)
      .hideBackButton(this.isShowBack)
      .width('100%')
      .menus(this.NavigationMenu(this.menuIcon))
  }
}