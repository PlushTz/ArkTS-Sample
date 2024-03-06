import router from '@ohos.router';
@Preview({title:'SplashView'})
@Entry
@Component
struct SplashView {
  @State intervalID: number = 0;

  build() {
    Column() {
      Image($r('app.media.splash_logo'))
        .width('100%')
        .objectFit(ImageFit.None)
        .height('100%')
        .onAppear(() => {
          animateTo({
            duration: 500,
            delay: 100,
            onFinish: () => {
              setTimeout(() => {
                router.replaceUrl({ url: 'pages/LoginView' });
              }, 1000);
            }
          }, () => {
          })
        })
    }.width('100%')
    .height('100%')
  }

  // onPageShow() {
  //   this.intervalID = setInterval(() => {
  //     router.replaceUrl({ url: 'pages/LoginView' });
  //   }, 1000)
  // }
  //
  // onPageHide() {
  //   clearInterval(this.intervalID)
  // }
}