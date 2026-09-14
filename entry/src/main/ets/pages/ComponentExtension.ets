import { HMRouter } from '@hadss/hmrouter';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/10
 * Email: lijt@eetrust.com
 */
@Component
struct Child {
  label: string = 'Child';
  @BuilderParam customBuilderParam: () => void;

  build() {
    Column() {
      this.customBuilderParam()
    }
    .width('100%')
  }
}

@HMRouter({ pageUrl: 'ParentChild' })
@Component
export struct Parent {
  label: string = 'Parent';

  @Builder
  componentBuilder() {
    Text(`${this.label}`) // @Builder内的this指向实际调用点的组件，在这个用例中因为调用点在Child组件内，所以this实际指向Child组件
      .fontSize(20)
      .margin(10)
  }

  @LocalBuilder
  componentLocalBuilder() {
    Text(`${this.label}`) // @LocalBuilder内的this指向声明@LocalBuilder函数Parent组件
      .fontSize(20)
      .margin(10)
  }

  build() {
    Column() {
      Child({ customBuilderParam: this.componentBuilder }) // Child组件内调用customBuilderParam显示字符串Child。
      Child({ customBuilderParam: this.componentLocalBuilder }) // 传递函数本身写法，Child组件内调用customBuilderParam显示字符串Parent。
      Child({
        customBuilderParam: () => {
          this.componentLocalBuilder()
        }
      }) // () => { 函数调用 }写法，Child组件内调用customBuilderParam显示字符串Parent。
    }
    .width('100%')
  }
}

class Tmp {
  public colors: number[] = []
}

@Builder
function overBuilder(tmp: Tmp) {
  ForEach(tmp.colors, (color: number, index: number) => {
    Text(`${index}}`).width('100%').height(50).backgroundColor(color)
  })
}

@Component
struct Child_Params {
  label: string = ''
  colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]

  aboutToAppear(): void {
  }

  @Builder
  customBuilder() {
  }

  @BuilderParam customOverBuilderParam: (tmp: Tmp) => void = overBuilder

  build() {
    Column() {
      this.customOverBuilderParam({ colors: this.colors })
    }
  }
}

@HMRouter({ pageUrl: 'Parent_Params' })
@Component
export struct Parent_Params {
  build() {
    Column() {
      Child_Params({ customOverBuilderParam: overBuilder })
    }
  }
}
