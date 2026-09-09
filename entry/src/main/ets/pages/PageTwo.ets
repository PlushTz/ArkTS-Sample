import { HMRouter, HMRouterMgr } from '@hadss/hmrouter';
import { ComponentActive, ComponentInactive } from '@kit.ArkUI';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/9
 * Email: lijt@eetrust.com
 */
@Builder
export function PageTwoBuilder() {
  PageTwo()
}

@HMRouter({ pageUrl: 'PageTwo' })
@Component
export struct PageTwo {
  build() {
    Column() {
      Text(`PageTwo`)
        .margin(10)
      Button(`PageOne`)
        .margin(10)
        .onClick(() => {
          // 跳转到PageOne页面
          HMRouterMgr.push({ pageUrl: 'PageOne' });
        })
        .width('40%')
      Button(`back`)
        .margin(10)
        .onClick(() => {
          // 返回上一页
          HMRouterMgr.pop();
        })
        .width('40%')
      Row() {
        Column() {
          TabsComponent();
        }
        .width('100%')
      }.layoutWeight(1)
      .margin(10)
    }
  }
}

// 冻结子组件：使用freezeWhenInactive配置
@Component({ freezeWhenInactive: true })
struct FreezeChild {
  @Link message: number;
  index: number = 0;

  @ComponentActive
  myActive() {
    // 组件从非激活状态变为激活状态时触发
    console.info(`FreezeChild myActive, index: ${this.index}`);
  }

  @ComponentInactive
  myInactive() {
    // 组件从激活状态变为非激活状态时触发
    console.info(`FreezeChild myInactive, index: ${this.index}`);
  }

  build() {
    Text(`message ${this.message}, index: ${this.index}`)
  }
}

@Component
struct TabsComponent {
  private data: number[] = [0, 1, 2];
  @State @Watch('onMessageUpdated') message: number = 0;

  onMessageUpdated() {
    console.info(`TabContent message callback func ${this.message}`);
  }

  build() {
    Column() {
      Button(`Incr state ${this.message}`)
        .onClick(() => {
          // 点击Button修改message，触发可见TabContent的onMessageUpdated回调
          this.message++;
        })
        .margin(10)
      Tabs() {
        ForEach(this.data, (item: number) => {
          TabContent() {
            // 将message作为@Link传递给FreezeChild，使状态可以在父子组件间同步
            FreezeChild({ message: this.message, index: item })
          }.tabBar(`tab${item}`)
        }, (item: number) => item.toString())
      }
      .vertical(false)
      .scrollable(true)
      .barMode(BarMode.Fixed)
      .barWidth(400)
      .barHeight(50)
      .animationDuration(400)
      .width('100%')
      .height(200)
      .backgroundColor(0xF5F5F5)
    }
  }
}