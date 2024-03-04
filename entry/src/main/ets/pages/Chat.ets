@Component
export struct Chat {
  build() {
    Column() {
      Navigation()
        .title('消息')
        .mode(NavigationMode.Auto)
    }
  }
}