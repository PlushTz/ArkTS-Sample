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

      Button('PreloadStateMonitorPage').margin({ top: 10 }).onClick(() => {
        HMRouterMgr.push({ pageUrl: 'PreloadStateMonitorPage' })
      })

      Button('VisibilityActivePage').margin({ top: 10 }).onClick(() => {
        HMRouterMgr.push({ pageUrl: 'VisibilityActivePage' })
      })

      Button('CustomLayoutPage').margin({ top: 10 }).onClick(() => {
        HMRouterMgr.push({ pageUrl: 'CustomLayoutPage' })
      })

    }.width('100%')
  }
}

@Reusable
@Component
struct Child {
  @ComponentReuse
  onReuse() {
    // 组件复用时触发
    console.info('Child onReuse');
  }

  aboutToReuse() {
    // 组件复用时触发
    console.info('Child aboutToReuse');
  }

  @ComponentActive
  onActive() {
    // 组件从非激活状态变为激活状态时触发
    console.info('Child onActive');
  }

  @ComponentRecycle
  onRecycle() {
    // 组件进入复用池时触发
    console.info('Child onRecycle');
  }

  aboutToRecycle(): void {
    // 组件进入复用池时触发
    console.info('Child aboutToRecycle');
  }

  @ComponentInactive
  onInActive() {
    // 组件从激活状态变为非激活状态时触发
    console.info('Child onInActive');
  }

  build() {
    Text('Child')
  }
}