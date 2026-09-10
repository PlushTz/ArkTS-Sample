import { HMRouter, HMRouterMgr } from '@hadss/hmrouter';
import {
  Binding,
  ComponentActive,
  ComponentInactive,
  ComponentRecycle,
  ComponentReuse,
  MutableBinding,
  UIUtils
} from '@kit.ArkUI';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/8
 * Email: lijt@eetrust.com
 */
@Reusable
@Component
struct Child {
  @ComponentReuse
  onReuse() {
    // 组件复用时触发
    console.info('Child onReuse');
  }

  aboutToReuse() {
    // 组件复用时触发
    console.info('Child aboutToReuse');
  }

  @ComponentActive
  onActive() {
    // 组件从非激活状态变为激活状态时触发
    console.info('Child onActive');
  }

  @ComponentRecycle
  onRecycle() {
    // 组件进入复用池时触发
    console.info('Child onRecycle');
  }

  aboutToRecycle(): void {
    // 组件进入复用池时触发
    console.info('Child aboutToRecycle');
  }

  @ComponentInactive
  onInActive() {
    // 组件从激活状态变为非激活状态时触发
    console.info('Child onInActive');
  }

  build() {
    Text('Child')
  }
}

@Builder
function customButton(num1: Binding<number>, num2: MutableBinding<number>) {
  Row() {
    Column() {
      Text(`number1:${num1.value}，number2:${num2.value}`)
      Button(`only change number2`).onClick((event: ClickEvent) => {
        num2.value += 1
      })
    }
  }
}


@HMRouter({ pageUrl: 'ParameterMakeBinding' })
@ComponentV2
export struct ParameterMakeBinding {
  @Local number1: number = 1
  @Local number2: number = 0

  build() {
    Column() {
      customButton(UIUtils.makeBinding(() => {
        return this.number1
      }), UIUtils.makeBinding(() => {
        return this.number2
      }, (value: number) => {
        this.number2 = value
      }))
    }
  }
}

@ObservedV2
class Tmp {
  @Trace paramA1 = ''
}

@Builder
function overBuilderByReference(tmp: Tmp) {
  Row() {
    Text(`UseStateVarByReference:${tmp.paramA1}`)
  }
}

@HMRouter({ pageUrl: 'ParameterReference' })
@Component
export struct ParameterReference {
  // @State label: string = 'Hello'

  tmp = new Tmp()

  build() {
    Column() {
      overBuilderByReference({ paramA1: this.tmp.paramA1 })
      Button('Click me').onClick((event: ClickEvent) => {
        this.tmp.paramA1 = 'ArkUI'
      })
    }
  }
}

@HMRouter({ pageUrl: 'PrivateBuilder' })
@Component
export struct PrivateBuilder {
  @State builderValue: string = 'Hello';

  @Builder
  builder() {
    Column() {
      Text(this.builderValue)
        .width(230)
        .height(40)
        .backgroundColor('#ffeae5e5')
        .borderRadius(20)
        .margin(12)
        .textAlign(TextAlign.Center)
    }
  }

  aboutToAppear(): void {
    setTimeout(() => {
      this.builderValue = 'Hello World';
    }, 2000);
  }

  build() {
    Row() {
      Column() {
        Text(this.builderValue)
          .width(230)
          .height(40)
          .backgroundColor('#ffeae5e5')
          .borderRadius(20)
          .textAlign(TextAlign.Center)
        this.builder()
        // 点击Button更新builderValue，用于更新文本显示
        Button('Click to change the builderValue')
          .onClick(() => {
            this.builderValue = 'builderValue was clicked';
          })
      }
      .height('100%')
      .width('100%')
    }
  }
}