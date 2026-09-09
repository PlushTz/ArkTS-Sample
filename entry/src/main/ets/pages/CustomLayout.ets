import { HMRouter } from '@hadss/hmrouter';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/9
 * Email: lijt@eetrust.com
 */
@HMRouter({ pageUrl: 'CustomLayoutPage' })
@Component
export struct CustomLayoutPage {
  borderColors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]

  build() {
    Column() {
      CustomLayout({
        builder: (): void => {
          columnChildren(this.borderColors)
        }
      }).background(Color.Brown)
    }
  }
}

@Builder
function columnChildren(borderColors: number[]) {
  ForEach([1, 2, 3], (item: number, index: number) => {
    Text('S' + item)
      .fontSize(30)
      .width(100)
      .height(100)
      .borderWidth(2)
      .borderColor(borderColors[index])
      .offset({ x: 10, y: 20 })
  })
}

@Component
struct CustomLayout {
  @Builder
  doNothingBuilder() {
  }

  @BuilderParam builder: () => void = this.doNothingBuilder

  result: SizeResult = {
    width: 0,
    height: 0
  }

  // 第一步：计算各子组件的大小
  onMeasureSize(selfLayoutInfo: GeometryInfo, children: Array<Measurable>, constraint: ConstraintSizeOptions) {
    let size = 100;
    children.forEach((child) => {
      let result: MeasureResult = child.measure({
        minHeight: size,
        minWidth: size,
        maxWidth: size,
        maxHeight: size
      })
      size += result.width / 2;
    })
    // this.result在该用例中代表自定义组件本身的大小，onMeasureSize方法返回的是组件自身的尺寸。
    this.result.width = 100;
    this.result.height = 400;
    return this.result;
  }

  // 第二步：放置各子组件的位置
  onPlaceChildren(selfLayoutInfo: GeometryInfo, children: Array<Layoutable>, constraint: ConstraintSizeOptions) {
    let startPos = 300;
    children.forEach((child) => {
      let pos = startPos - child.measureResult.height;
      child.layout({ x: pos, y: pos })
    })
  }

  build() {
    this.builder()
  }
}