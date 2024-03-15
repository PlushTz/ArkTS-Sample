import router from '@ohos.router'
import { Toolbar } from '../common/CommonComponents'
import { ListPage } from '../pages/ListPage'
import { ImageMode } from '../mode/ImageMode'
import { ImageUrl } from '../globle/ImageUrl'
import { ConversationMode } from '../mode/ConversationMode'

@Preview
@Component
export struct ChatPage {
  private data: Array<ConversationMode> = [
    new ConversationMode(ImageUrl.URL10,'测试1','19:23','在布局容器内，可以通过justifyContent属性设置子元素在容器主轴上的排列方式。可以从主轴起始位置开始排布，也可以从主轴结束位置开始排布，或者均匀分割主轴的空间'),
    new ConversationMode(ImageUrl.URL2,'测试2','06:14','图3 Column容器内排列方向的间距图'),
    new ConversationMode(ImageUrl.URL3,'测试3','18:13','图4 Row容器内排列方向的间距图'),
    new ConversationMode(ImageUrl.URL4,'测试4','19:53','SysCap，全称SystemCapability，即系统能力，指操作系统中每一个相对独立的特性'),
    new ConversationMode(ImageUrl.URL5,'测试5','16:13','通过textOverflow属性控制文本超长处理，textOverflow需配合maxLines一起使用（默认情况下文本自动折行）'),
    new ConversationMode(ImageUrl.URL6,'测试6','10:43','通过lineHeight属性设置文本行高。'),
    new ConversationMode(ImageUrl.URL7,'测试7','13:56','通过decoration属性设置文本装饰线样式及其颜色。'),
    new ConversationMode(ImageUrl.URL8,'测试8','15:46','通过baselineOffset属性设置文本基线的偏移量。'),
    new ConversationMode(ImageUrl.URL9,'测试9','17:20','通过letterSpacing属性设置文本字符间距。'),
    new ConversationMode(ImageUrl.URL10,'测试10','12:21','通过minFontSize与maxFontSize自适应字体大小，minFontSize设置文本最小显示字号，maxFontSize设置文本最大显示字号，minFontSize与maxFontSize必须搭配同时使用，以及需配合maxline或布局大小限制一起使用，单独设置不生效。'),
    new ConversationMode(ImageUrl.URL11,'测试11','12:21','Hello!'),
    new ConversationMode(ImageUrl.URL12,'测试12','12:21','Android HarmonyOS'),
    new ConversationMode(ImageUrl.URL13,'测试13','12:21','通过textCase属性设置文本大小写。'),
    new ConversationMode(ImageUrl.URL14,'测试14','12:21','通过copyOption属性设置文本是否可复制粘贴。'),
    new ConversationMode(ImageUrl.URL15,'测试15','12:21','通过letterSpacing属性设置文本字符间距。'),
    new ConversationMode(ImageUrl.URL16,'测试16','12:21','Ha ha'),
    new ConversationMode(ImageUrl.URL17,'测试17','12:21','[表情][表情][表情]'),
    new ConversationMode(ImageUrl.URL18,'测试18','12:21','[表情][表情]'),
    new ConversationMode(ImageUrl.URL19,'测试19','12:21','[表情][表情][表情][表情]'),
    new ConversationMode(ImageUrl.URL20,'测试20','12:21','[表情][表情][表情][表情][表情][表情][表情][表情]')
  ]

  build() {
    Column() {
      Toolbar({
        title: '消息',
        titleColor: $r('app.color.white'),
        isShowMenu: true,
        menuIcon: $r('app.media.nav_add_icon'),
        onMenuClick: () => {
          router.pushUrl({ url: 'pages/LoginPage' })
        },
        titleMode: NavigationTitleMode.Mini
      }).height(50).backgroundColor($r('app.color.black'))
      ListPage({
        data: this.data,
        onItemClick: (item) => {

        }
      })
        .width('100%')
        .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.white'))
  }
}