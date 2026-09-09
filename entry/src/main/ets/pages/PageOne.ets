import { HMRouter, HMRouterMgr } from "@hadss/hmrouter"

@Builder
export function PageOneBuilder() {
  PageOne()
}

@HMRouter({ pageUrl: 'PageOne' })
@Component
export struct PageOne {
  textFont: Font = {
    style: FontStyle.Normal,
    size: 20
  }

  build() {
    Column() {
      Text(`PageOne`)
        .margin(10)
      Button('PageTwo')
        .margin(10)
        .onClick(() => {
          // 跳转到PageTwo页面
          HMRouterMgr.push({ pageUrl: 'PageTwo' })
        })
        .width('40%')
      Button(`back`)
        .margin(10)
        .onClick(() => {
          // 返回上一页
          HMRouterMgr.pop()
        })
        .width('40%')
    }
  }
}