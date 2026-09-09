import { HMRouter } from '@hadss/hmrouter'
import router from '@ohos.router'

@Preview({ title: 'SplashView' })
@HMRouter({
  pageUrl: 'SplashPage',
  lifecycle: 'pageLifecycle',
  animator: 'pageAnimator'
})
@Entry
@Component
export struct SplashPage {
  @State intervalID: number = 0

  build() {
    Column() {
      Image($r('app.media.splash_logo'))
        .width('100%')
        .objectFit(ImageFit.None)
        .height('100%')
        .onAppear(() => {

        })
    }.width('100%')
    .height('100%')
  }
}