import StringUtils from '../utils/StringUtils'
import prompt from '@ohos.prompt';
import promptAction from '@ohos.promptAction';
import toaster from '../views/Toaster';

@Entry
@Component
struct LoginView {
  @State username: string = ''
  @State password: string = ''

  build() {
    RelativeContainer() {
      Row() {
        Image($r('app.media.start_logo_icon')).objectFit(ImageFit.None)
      }
      .margin({ top: 100, left: 100 })
      .alignRules({
        top: { anchor: '__container__', align: VerticalAlign.Top },
        left: { anchor: '__container__', align: HorizontalAlign.Start }
      })
      .width('100')
      .height('100')
      .id('login_logo')

      Text('Hello!欢迎登录')
        .fontSize('35')
        .fontColor($r('app.color.black'))
        .fontStyle(FontStyle.Normal)
        .margin({ top: 20 })
        .alignRules({
          top: { anchor: 'login_logo', align: VerticalAlign.Bottom },
          left: { anchor: 'login_logo', align: HorizontalAlign.Center }
        })
        .id('label_login')

      TextInput({ placeholder: '请输入用户名' })
        .margin({ top: 50, right: 100 })
        .height('45')
        .type(InputType.Normal)
        .onChange((value) => {
          this.username = value
        })
        .alignRules({
          top: { anchor: 'label_login', align: VerticalAlign.Bottom },
          left: { anchor: 'label_login', align: HorizontalAlign.Start },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })
        .id('input_username')

      TextInput({ placeholder: '请输入密码' })
        .margin({ top: 30, right: 100 })
        .width('40%')
        .height('45')
        .type(InputType.Password)
        .onChange((value) => {
          this.password = value
        })
        .alignRules({
          top: { anchor: 'input_username', align: VerticalAlign.Bottom },
          left: { anchor: 'input_username', align: HorizontalAlign.Start },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })
        .id('input_verification_code')

      Button('登录')
        .height('45')
        .margin({ top: 50, right: 100 })
        .fontColor($r('app.color.start_window_background'))
        .stateEffect(true)
        .borderRadius(8)
        .type(ButtonType.Normal)
        .onClick(() => {
          if (StringUtils.isEmpty(this.username)) {
            toaster.showToaster('请输入用户名', 500)
            return
          }
          if (StringUtils.isEmpty(this.password)) {
            toaster.showToaster('请输入密码', 500)
            return
          }
        })
        .alignRules({
          top: { anchor: 'input_verification_code', align: VerticalAlign.Bottom },
          left: { anchor: 'input_verification_code', align: HorizontalAlign.Start },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })
        .id('btn_login')
    }.backgroundColor('#ffffff')
    .width('100%')
    .height('100%')
  }
}