import hilog from '@ohos.hilog'
import router from '@ohos.router'
import common from '@ohos.app.ability.common'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
        // ButtonType 按钮样式
        Button(this.message, { type: ButtonType.Normal, stateEffect: true }).width('40%')
          .onClick(() => {
            this.message = "ArkTs"
            hilog.error(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
          })
            // 设置圆角
          .borderRadius(5)

        Button('胶囊样式', { type: ButtonType.Capsule, stateEffect: true }).margin({ top: 10 }).width('50%')

        // Button('圆形', { type: ButtonType.Circle, stateEffect: true }).margin({ top: 10 }).width('15%')

        Button('路由跳转').width('100').height('40').onClick(() => {
          router.pushUrl({
            url: 'pages/Second'
          }, router.RouterMode.Standard, (err) => {
            if (err) {
              console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`)
              return;
              console.info('Invoke pushUrl succeeded.')
            }
          })
        }).margin({ top: 10 })

        Button('跳转Ability', { type: ButtonType.Normal, stateEffect: true })
          .margin({ top: 10, left: 10, right: 10 })
          .width('100%')
          .borderRadius(5).onClick(() => {
          this.startSecondAbility('SecondAbility')
        })
      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.black'))
    }
    .width('100%')
    .height('100%')
    // .backgroundColor()
  }

  startSecondAbility(name: string) {
    try {
      let want = {
        deviceId: '', // deviceId为空表示本设备
        bundleName: 'com.example.myapplication',
        abilityName: name,
        parameters: {
          // from: 'OpenPage.ets',
          data: {
            hello: 'word',
            who: 'please'
          }
        }
      };
      let context = getContext(this) as common.UIAbilityContext;
      context.startAbility(want);
      console.info(`explicit start ability succeed`)
    } catch (error) {
      console.info(`explicit start ability failed with ${error.code}`)
    }
  }
}