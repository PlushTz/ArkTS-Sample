import { ImageMode } from '../mode/ImageMode'

@Entry
@Preview
@Component
struct NavigationPage {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack()
  imageMode: ImageMode = new ImageMode(1, '');

  build() {
    Navigation(this.navPathStack) {
      Column({ space: 20 }) {
        Button('跳转到首页').onClick(() => {
          this.navPathStack.pushPathByName('PageOne', this.imageMode, true);
        })
      }.width('100%').height('100%').justifyContent(FlexAlign.Center)
    }
  }
}