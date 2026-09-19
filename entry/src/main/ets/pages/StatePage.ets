import { HMRouter, HMRouterMgr } from '@hadss/hmrouter';
import ComponentsName from '../constants/ComponentsName';
import RouterPath from '../constants/RouterPath';
import { ComponentModel } from '../mode/ComponentModel';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/19
 * Email: tao351992257@163.com
 */
@ComponentV2
export struct StatePage {
  @Local components: ComponentModel[] = []

  aboutToAppear(): void {
    console.info('ArkUiPage -> aboutToAppear')
    this.components.push({ componentName: ComponentsName.STATE_LOCAL, pageUrl: RouterPath.STATE_LOCAL_PATH })
    this.components.push({ componentName: '状态管理@Computed', pageUrl: '状态管理@Computed' })
  }

  @Builder
  customComponentsItem(model: ComponentModel) {
    Text(`${model.componentName}`)
      .width('100%')
      .textAlign(TextAlign.Center)
      .fontSize(16)
      .fontWeight(FontWeight.Medium)
      .fontColor($r('app.color.white'))
  }

  build() {
    List() {
      ForEach(this.components, (item: ComponentModel, index: number) => {
        ListItem({ style: ListItemStyle.NONE }) {
          this.customComponentsItem(item)
        }.height(45).onClick(() => {
          HMRouterMgr.push({ pageUrl: item.pageUrl })
        })
      })
    }.width('100%').height('100%').divider({ strokeWidth: 0.5, color: $r('app.color.blue2') })
  }
}