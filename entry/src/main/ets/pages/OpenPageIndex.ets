/**
 * 路由 3.1/4.0 文档
 * https://developer.harmonyos.com/cn/docs/documentation/doc-references-V3/js-apis-router-0000001478061893-V3#ZH-CN_TOPIC_0000001523808578__routerpushurl9
 *
 */
import router from '@ohos.router';
import common from '@ohos.app.ability.common';


@Entry
@Component
struct OpenPageIndex {
  @State extParams: string = ''
  private expParamsO: Object
  private context = getContext(this) as common.UIAbilityContext;

  aboutToAppear() {
    this.expParamsO = router.getParams();
    this.extParams = JSON.stringify(this.expParamsO, null, '\t');
  }

  build() {
    Column() {

      List() {
        ListItemGroup() {
          ListItem() {
            Text(this.extParams)
              .width('96%')
              .fontSize(18)
              .fontColor(Color.Green)
              .backgroundColor(Color.White)
          }
          .width('100%')
          .align(Alignment.Start)
          .backgroundColor(0xFFFFFF)
          .borderRadius('16vp')
          .padding('12vp')

        }.divider({
          strokeWidth: 1,
          startMargin: 0,
          endMargin: 0,
          color: '#ffe5e5e5'
        })

        ListItemGroup() {

          ListItem() {
            Text('启动UIAbility页面')
              .width('96%')
              .fontSize(18)
              .fontColor(Color.Black)
              .backgroundColor(Color.White)
          }
          .width('100%')
          .height(50)
          .align(Alignment.Start)
          .backgroundColor(0xFFFFFF)
          .padding({ left: 10 })
          .onClick(() => {
            this.startAbilityTest('LocalStorageAbility')
          })

          ListItem() {
            Text('启动@Entry页面')
              .width('96%')
              .fontSize(18)
              .fontColor(Color.Black)
              .backgroundColor(Color.White)
          }
          .width('100%')
          .height(50)
          .align(Alignment.Start)
          .backgroundColor(0xFFFFFF)
          .padding({ left: 10 })
          .onClick(() => {
            router.pushUrl({ url: 'pages/Test', params: {
              "from": "pages/OpenPage.ets"
            } })
              .then(() => {
                console.info('Succeeded in jumping to the second page.')
              }).catch((error) => {
              console.log(error)
            })
          })

        }.divider({
          strokeWidth: 1,
          startMargin: 0,
          endMargin: 0,
          color: '#ffe5e5e5'
        })

      }.width('100%').height('90%')
      .divider({
        strokeWidth: px2vp(20),
        startMargin: 0,
        endMargin: 0,
        color: '#ffe5e5e5'
      })

    }.width('100%').height('100%')
    .padding({ top: px2vp(111), left: '12vp', right: '12vp' })
    .backgroundColor('#ffe5e5e5')
  }

  async startAbilityTest(name: string) {
    try {
      let want = {
        deviceId: '', // deviceId为空表示本设备
        bundleName: 'com.harvey.testharmony',
        abilityName: name,
        parameters: {
          from: 'OpenPage.ets',
          data: {
            hello: 'word',
            who: 'please'
          }
        }
      };
      let context = getContext(this) as common.UIAbilityContext;
      await context.startAbility(want);
      console.info(`explicit start ability succeed`);
    } catch (error) {
      console.info(`explicit start ability failed with ${error.code}`);
    }

  }
}

