import { HMRouter, HMRouterMgr } from '@hadss/hmrouter'

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/10
 * Email: lijt@eetrust.com
 */
class CustomComponentModel {
  text: string = ''
  pageUrl: string = ''
}

@HMRouter({ pageUrl: 'CustomComponentList' })
@Component
export struct CustomComponentList {
  customComponents: CustomComponentModel[] = []

  aboutToAppear(): void {
    this.customComponents.push({ text: 'PageOne', pageUrl: 'PageOne' })
    this.customComponents.push({ text: 'PageTwo', pageUrl: 'PageTwo' })
    this.customComponents.push({ text: 'PreloadStateMonitorPage', pageUrl: 'PreloadStateMonitorPage' })
    this.customComponents.push({ text: 'VisibilityActivePage', pageUrl: 'VisibilityActivePage' })
    this.customComponents.push({ text: 'CustomLayoutPage', pageUrl: 'CustomLayoutPage' })
    this.customComponents.push({ text: 'ParameterMakeBinding', pageUrl: 'ParameterMakeBinding' })
    this.customComponents.push({ text: 'ParameterReference', pageUrl: 'ParameterReference' })
    this.customComponents.push({ text: 'PrivateBuilder', pageUrl: 'PrivateBuilder' })
    this.customComponents.push({ text: 'ParentChild', pageUrl: 'ParentChild' })
  }

  build() {
    Stack() {
      List() {
        ForEach(this.customComponents, (item: CustomComponentModel, index: number) => {
          ListItem({ style: ListItemStyle.NONE }) {
            customComponentsItem(item)
          }.height(45).onClick(() => {
            HMRouterMgr.push({ pageUrl: item.pageUrl })
          })
        })
      }.width('100%').height('100%').divider({ strokeWidth: 0.5, color: $r('app.color.blue2') })
    }.width('100%').height('100%')
  }
}

@Builder
function customComponentsItem(model: CustomComponentModel) {
  Text(`${model.text}`)
    .width('100%')
    .textAlign(TextAlign.Center)
    .fontSize(16)
    .fontWeight(FontWeight.Medium)
}