import { HMRouter } from '@hadss/hmrouter';
import OutTabsComponent from './OutTabsComponent';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/19
 * Email: tao351992257@163.com
 */


@HMRouter({ pageUrl: 'ArkUi$HomePage' })
@ComponentV2
export struct HomePage {
  build() {
    Column() {
      OutTabsComponent()
    }.height('100%')
    .width('100%')
    .expandSafeArea([SafeAreaType.SYSTEM])
  }
}

