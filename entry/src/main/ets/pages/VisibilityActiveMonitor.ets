import { HMRouter } from '@hadss/hmrouter';
import { ComponentActive, ComponentInactive } from '@kit.ArkUI';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/9
 * Email: lijt@eetrust.com
 */
@HMRouter({ pageUrl: 'VisibilityActivePage' })
@Component
export struct VisibilityActivePage {
  @State stateVar: string = 'Hello World'

  @ComponentActive
  myActive() {
    // 组件从非激活状态变为激活状态时触发
    console.info(`myActive`);
  }

  @ComponentInactive
  myInactive() {
    // 组件从激活状态变为非激活状态时触发
    console.info(`myInactive`);
  }

  build() {
    Column() {
      Text(this.stateVar)
    }
    .width(`100%`)
    .height(`100%`)
  }
}