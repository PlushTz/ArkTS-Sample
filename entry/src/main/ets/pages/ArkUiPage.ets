import { HMRouterMgr } from '@hadss/hmrouter';
import { ComponentModel } from '../mode/ComponentModel';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/19
 * Email: tao351992257@163.com
 */
@ComponentV2
export struct ArkUiPage {
  @Local components: ComponentModel[] = []

  aboutToAppear(): void {
    console.info('ArkUiPage -> aboutToAppear')
    this.components.push({ componentName: '1', pageUrl: '' })
    this.components.push({ componentName: '2', pageUrl: '' })
    this.components.push({ componentName: '3', pageUrl: '' })
    this.components.push({ componentName: '4', pageUrl: '' })
    this.components.push({ componentName: '5', pageUrl: '' })
    this.components.push({ componentName: '6', pageUrl: '' })
    this.components.push({ componentName: '7', pageUrl: '' })
    this.components.push({ componentName: '8', pageUrl: '' })
    this.components.push({ componentName: '9', pageUrl: '' })
    this.components.push({ componentName: '10', pageUrl: '' })
    this.components.push({ componentName: '11', pageUrl: '' })
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
