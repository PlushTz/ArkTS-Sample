import { HMDefaultGlobalAnimator, HMNavigation } from '@hadss/hmrouter'
import { AttributeUpdater } from '@kit.ArkUI'
import { C } from '../utils/Class'

@Entry
@Component
struct Index {
  navModifier = new NavModifier()

  aboutToAppear(): void {
    let c = new C(1);
    c.foo(1212121, false)
    c.foo('x1', true)
    c.foo('x2', false)
    c.foo('2', false, '123')
  }

  build() {
    Column() {
      HMNavigation({
        navigationId: 'indexNavigation', homePageUrl: 'CustomComponentList', options: {
          standardAnimator: HMDefaultGlobalAnimator.STANDARD_ANIMATOR,
          dialogAnimator: HMDefaultGlobalAnimator.DIALOG_ANIMATOR,
          modifier: this.navModifier
        }
      })
    }
    .width('100%')
    .height('100%')
  }
}

class NavModifier extends AttributeUpdater<NavigationAttribute> {
  override initializeModifier(instance: NavigationAttribute): void {
    instance.hideNavBar(true)
  }
}
