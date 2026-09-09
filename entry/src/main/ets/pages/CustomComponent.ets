import { HMRouter, HMRouterMgr } from '@hadss/hmrouter';
import { ComponentActive, ComponentInactive, ComponentRecycle, ComponentReuse } from '@kit.ArkUI';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/8
 * Email: lijt@eetrust.com
 */
@HMRouter({ pageUrl: 'CustomComponentPage' })
@Entry
@Component
export struct CustomComponentPage {
  @State changeChild: boolean = false

  build() {
    Column() {
      Button('change').margin(10).onClick(() => {
        this.changeChild = !this.changeChild;
      })
      if (this.changeChild) {
        Child()
      }

      Button('PageOne').onClick(() => {
        HMRouterMgr.push({ pageUrl: 'PageOne' }, {
          onResult: (info: PopInfo) => {
            console.info(`PopInfo = ${info}`)
          }, onArrival: () => {
            console.info('onArrival')
          }, onLost: () => {
            console.info('onLost')
          }
        })
      }).margin({ bottom: 10 })

      Button('PageTwo').onClick(() => {
        HMRouterMgr.pushAsync({ pageUrl: 'PageTwo' }, {
          onResult: (popInfo: PopInfo) => {
            console.info(`PopInfo = ${popInfo}}`)
          }, onArrival: () => {
            console.info('onArrival')
          }, onLost: () => {
            console.info('onLost')
          }
        })
      })

      Button('').onClick(() => {
        HMRouterMgr.push({})
      })

    }.width('100%')
  }
}

@Reusable
@Component
struct Child {
  @ComponentReuse
  onReuse() {
    console.info('Child onReuse');
  }

  aboutToReuse() {
    console.info('Child aboutToReuse');
  }

  @ComponentActive
  onActive() {
    console.info('Child onActive');
  }

  @ComponentRecycle
  onRecycle() {
    console.info('Child onRecycle');
  }

  aboutToRecycle(): void {
    console.info('Child aboutToRecycle');
  }

  @ComponentInactive
  onInActive() {
    console.info('Child onInActive');
  }

  build() {
    Text('Child')
  }
}