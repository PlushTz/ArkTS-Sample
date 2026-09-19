import { HMRouter } from '@hadss/hmrouter'
import RouterPath from '../constants/RouterPath'

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/19
 * Email: tao351992257@163.com
 */
@HMRouter({ pageUrl: RouterPath.COLUMN_COMPONENT_PATH })
@ComponentV2
export struct ColumnComponent {
  build() {
    Column().width('100%').height('100%')
  }
}