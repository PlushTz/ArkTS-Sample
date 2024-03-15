import { ChatPage } from './ChatPage'
import { ContactPage } from './ContactPage'
import { PersonPage } from './PersonPage'

@Entry
@Component
struct HomePage {
  private tabsController = new TabsController();
  @State currentIndex: number = 0;

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        ChatPage()
      }.tabBar(this.TabBuilder('消息', 0, $r('app.media.tabbar_dudu_visited_icon'), $r('app.media.tabbar_dudu_icon')))

      TabContent() {
        ContactPage()
      }
      .tabBar(this.TabBuilder('通讯录', 1, $r('app.media.tabbar_contact_visited_icon'), $r('app.media.tabbar_contact_icon')))

      TabContent() {
        PersonPage()
      }
      .tabBar(this.TabBuilder('个人中心', 2, $r('app.media.tabbar_person_visited_icon'), $r('app.media.tabbar_person_icon')))
    }.onChange((index) => {
      this.currentIndex = index;
    })
  }

  @Builder
  TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 24, height: 24 })
        .fillColor(this.currentIndex === targetIndex ? $r('app.color.tab_tv_pressed') : $r('app.color.tab_tv_normal'));
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? $r('app.color.tab_tv_pressed') : $r('app.color.tab_tv_normal'))
        .fontSize(11);
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.white'))
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(targetIndex);
    })
  }
}