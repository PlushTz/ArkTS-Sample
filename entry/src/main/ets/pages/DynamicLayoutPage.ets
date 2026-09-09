import { HMRouter } from '@hadss/hmrouter';
import {
  DynamicLayout,
  RowLayoutAlgorithm,
  ColumnLayoutAlgorithm,
  LayoutAlgorithm,
  LayoutConstraint,
  CustomLayoutAlgorithm,
  FrameNode,
  Position,
} from '@kit.ArkUI';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/2
 * Email: lijt@eetrust.com
 */
@HMRouter({ pageUrl: 'DynamicLayoutPage' })
@Entry
@ComponentV2
export struct DynamicLayoutPage {
  @Local algorithm: LayoutAlgorithm = new CustomLayoutExample()

  build() {
    Column({ space: 10 }) {
      DynamicLayout(this.algorithm) {
        Text('Item 1')
          .fontSize(16)
          .backgroundColor(0xF5DEB3)
          .padding(10)
        Text('Item 2')
          .fontSize(16)
          .backgroundColor(0xD2B48C)
          .padding(10)
        Text('Item 3')
          .fontSize(16)
          .backgroundColor(0xF5DEB3)
          .padding(10)
      }
      .width('100%')
      .height(150)
      .backgroundColor(0xEFEFEF)

      Button('切换为Column布局')
        .fontSize(16)
        .onClick(() => {
          this.algorithm = new ColumnLayoutAlgorithm();
        })
    }.width('100%').padding(10)
  }
}

class CustomLayoutExample extends CustomLayoutAlgorithm {
  onMeasure(self: FrameNode, constraint: LayoutConstraint): void {
    // 1. 获取子组件数量
    const childCount = self.getChildrenCount();
    let totalWidth = 0;
    let maxHeight = 0;
    // 2. 遍历子组件，进行测量
    for (let i = 0; i < childCount; i++) {
      const child = self.getChild(i);
      if (child) {
        // 3. 创建子组件的布局约束
        const childConstraint: LayoutConstraint = {
          maxSize: { width: 150, height: 150},
          minSize: { width: 150, height: 150},
          percentReference: constraint.percentReference
        };
        // 4. 测量子组件
        child.measure(childConstraint);
        // 5. 获取子组件测量后的尺寸
        const childSize = child.getMeasuredSize();
        totalWidth += childSize.width;
        maxHeight = Math.max(maxHeight, childSize.height);
      }
    }
    const measuredSize: Size = {
      width: Math.min(totalWidth, constraint.maxSize.width),
      height: Math.min(maxHeight, constraint.maxSize.height)
    };
    // 6. 设置自身的测量尺寸
    self.setMeasuredSize(measuredSize);
  }

  onLayout(self: FrameNode, position: Position): void {
    // 1. 获取子组件数量
    const childCount = self.getChildrenCount();
    let offsetX = 0;
    // 2. 遍历子组件，设置布局位置
    for (let i = 0; i < childCount; i++) {
      const child = self.getChild(i);
      if (child) {
        // 3. 获取子组件测量后的尺寸
        const childSize = child.getMeasuredSize();
        const childPosition: Position = {
          x: offsetX,
          y: 0
        };
        // 4. 设置子组件的布局位置
        child.layout(childPosition);
        // 5. 更新偏移量
        offsetX += childSize.width;
      }
    }
    // 6. 设置自身的布局位置
    self.setLayoutPosition(position);
  }
}
