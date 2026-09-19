import { ArkUiPage } from "./ArkUiPage"
import { StatePage } from "./StatePage"

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/19
 * Email: tao351992257@163.com
 */
@ObservedV2
class TabModel {
  @Trace tabName: string = ''
  @Trace tabRes?: Resource

  constructor(tabName: string, tabRes?: Resource) {
    this.tabName = tabName;
    this.tabRes = tabRes;
  }
}

@ComponentV2
export default struct OutTabsComponent {
  @Local currentIndex: number = 0
  @Local tabs: TabModel[] = []
  @Local switchNext: boolean = false
  private tabsController: TabsController = new TabsController()

  @Monitor('switchNext')
  onChangeSwitchNext() {
    if (this.switchNext) {
      this.switchNext = false
      this.tabsController.changeIndex(1)
    }
  }

  aboutToAppear(): void {
    this.tabs.push(new TabModel('ArkUi'))
    this.tabs.push(new TabModel('State'))
  }

  build() {
    Tabs({ barPosition: BarPosition.End, index: this.currentIndex, controller: this.tabsController }) {
      ForEach(this.tabs, (item: TabModel, index: number) => {
        TabContent() {
          if (item.tabName == 'ArkUi') {
            ArkUiPage()
          } else if (item.tabName == 'State') {
            StatePage()
          }
        }.tabBar(this.tabBuilder(index, item.tabName, item.tabRes))
      }, (item: TabModel) => item.tabName)
    }
    .vertical(false) // true to make the tab bar in side
    // [End tabs_vertical]
    .barMode(BarMode.Fixed)
    // [EndExclude disable_scroll_switch]
    .scrollable(true) // false to disable scroll to switch
    .onChange((index: number) => {
      this.currentIndex = index
    })
    .height('100%')
    .width('100%')
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
    .barHeight(56)
    .barBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
    .barOverlap(true)
  }

  @Builder
  tabBuilder(index: number, name: ResourceStr, icon?: Resource) {
    Column() {
      if (icon) {
        SymbolGlyph(icon).fontColor([this.currentIndex === index
          ? $r('app.color.out_tab_bar_font_active_color')
          : $r('app.color.out_tab_bar_font_inactive_color')]).fontSize(25)
      }
      Text(name)
        .margin({ top: 4 })
        .fontSize(10)
        .fontColor(this.currentIndex === index
          ? $r('app.color.out_tab_bar_font_active_color')
          : $r('app.color.out_tab_bar_font_inactive_color'))
    }.justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}