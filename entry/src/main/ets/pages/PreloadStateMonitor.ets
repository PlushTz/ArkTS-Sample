import { HMRouter } from '@hadss/hmrouter';
import { BasicDataSource } from '../datasoure/DataSource';
import { ComponentActive, ComponentInactive } from '@kit.ArkUI';

/**
 * Desc:预加载场景下监听激活状态变化
 * 以LazyForEach为例，
 * LazyForEach预加载区域的组件创建完毕转变为非激活态。
 * List、Swiper、Grid、WaterFlow等组件使用LazyForEach时，
 * 可以通过cachedCount的count属性设置预加载区域的节点数量。
 * 本示例展示了List和LazyForEach场景下的组件激活/非激活状态变化。
 * @author 李锦涛
 * Created on 2026/9/9
 * Email: lijt@eetrust.com
 */
@HMRouter({ pageUrl: 'PreloadStateMonitorPage' })
@Component
export struct PreloadStateMonitorPage {
  @State dataSource: MyDataSource<string> = new MyDataSource()
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F];
  @State changeShow: boolean = false;

  aboutToAppear(): void {
    for (let index = 1; index <= 50; index++) {
      this.dataSource.pushData(`page - ${index}`)
    }
  }

  build() {
    Column() {
      Button('change').onClick(() => {
        this.changeShow = !this.changeShow
      })
      if (this.changeShow) {
        List({ space: 10 }) {
          LazyForEach(this.dataSource, (item: string, index: number) => {
            ListItem({ style: ListItemStyle.CARD }) {
              Child({ item: item, index: index.toString() })
            }.width('100%').height('15%').backgroundColor(Color.Pink)
          }, (item: string) => {
            return item.toString()
          })
        }.width('100%').height('100%').cachedCount(5, false)
      }
    }.width('100%')
  }
}

@Component
struct Child {
  @State index: string = '';
  @State item: string = '';

  @ComponentActive
  myActive() {
    // 组件从非激活状态变为激活状态时触发
    console.info(`Child myActive, index: ${this.index}`);
  }

  @ComponentInactive
  myInactive() {
    // 组件从激活状态变为非激活状态时触发
    console.info(`Child myInactive, index: ${this.index}`);
  }

  build() {
    Column() {
      Text(`Item ${this.item}`)
    }
  }
}

class MyDataSource<T> extends BasicDataSource<T> {
  private dataArray: T[] = []

  totalCount(): number {
    return this.dataArray.length
  }

  getData(index: number): T {
    return this.dataArray[index]
  }

  pushData(data: T) {
    this.dataArray.push(data)
    this.notifyDataAdd(this.dataArray.length - 1)
  }
}