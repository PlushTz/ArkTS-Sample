import { HMRouter } from "@hadss/hmrouter";

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/11
 * Email: lijt@eetrust.com
 */
@Builder
function myBuilder(value: string, size: number) {
  Text(value)
    .fontSize(size)
    .margin(10)
}

// 使用wrapBuilder封装myBuilder，并赋值给globalBuilder变量
let globalBuilder: WrappedBuilder<[string, number]> = wrapBuilder(myBuilder);

@HMRouter({ pageUrl: 'TestIndex' })
@Component
export struct TestIndex {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        globalBuilder.builder(this.message, 50);
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Builder
function myBuilder0(value: string, size: number) {
  Text(value)
    .fontSize(size)
    .fontColor(Color.Blue)
    .margin(10)
}

@Builder
function yourBuilder(value: string, size: number) {
  Text(value)
    .fontSize(size)
    .fontColor(Color.Pink)
    .margin(10)
}

const builderArr: WrappedBuilder<[string, number]>[] = [wrapBuilder(myBuilder0), wrapBuilder(yourBuilder)];


@HMRouter({ pageUrl: 'IndexItem' })
@Component
struct IndexItem {
  @Builder
  IndexItem() {
    // IndexItem使用ForEach进行不同@Builder函数的渲染
    ForEach(builderArr, (item: WrappedBuilder<[string, number]>) => {
      item.builder('Hello World', 30);
    })
  }

  build() {
    Row() {
      Column() {
        this.IndexItem();
      }
      .width('100%')
    }
    .height('100%')
  }
}