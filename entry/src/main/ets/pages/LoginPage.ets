/**
 * Desc:
 * @author lijt
 * Created on 2024/3/13
 * Email: lijt@eetrust.com
 */
import router from '@ohos.router'

@Entry
@Component
struct LoginPage {
  @State username: string = ''
  @State password: string = ''
  scroller: Scroller = new Scroller()

  build() {
    Scroll() {
      Column() {
        Row() {
          Image($r('app.media.start_logo_icon')).width(80)
            .margin({ top: 30, left: 30, bottom: 30 })
        }
        .width('100%')
        .backgroundColor($r('app.color.white'))

        Row() {
          Text('Hello!欢迎登录')
            .fontSize(30)
            .fontColor($r('app.color.black'))
            .margin({ left: 38, bottom: 20 })
        }
        .width('100%')
        .backgroundColor($r('app.color.start_window_background'))

        Row() {
          Blank().width(35)
          TextInput({ placeholder: '请输入账号' })
            .type(InputType.Normal)
            .layoutWeight(1)
            .height(45)
            .margin({ top: 30 })
            .onChange((value) => {
              this.username = value
            })
          Blank().width(35)
        }
        .width('100%')
        .backgroundColor($r('app.color.white'))

        Row() {
          Blank().width(35)
          TextInput({ placeholder: '请输入密码' })
            .type(InputType.Password)
            .layoutWeight(1)
            .height(45)
            .margin({ top: 30 })
            .onChange((value) => {
              this.password = value
            })
          Blank().width(35)
        }
        .width('100%')
        .backgroundColor($r('app.color.white'))

        Row() {
          Blank().width(35)
          Button('登录')
            .height(45)
            .stateEffect(true)
            .layoutWeight(1)
            .margin({ top: 30 })
            .onClick(() => {
              router.replaceUrl({ url: 'pages/HomePage' })
            })
          Blank().width(35)
        }.width('100%').backgroundColor($r('app.color.white'))

        Row() {
          Row() {
            Checkbox().onChange((value: boolean) => {

            })
            Text('《隐私政策》')
              .fontSize(14)
              .fontColor($r('app.color.blue'))
              .layoutWeight(1)
          }.margin({ left: 35, top: 35 })
        }
      }
      .width('100%')
      .backgroundColor($r('app.color.white'))
    }
  }
}