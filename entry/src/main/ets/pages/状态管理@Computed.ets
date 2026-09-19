import { HMRouter } from '@hadss/hmrouter';
import { hilog } from '@kit.PerformanceAnalysisKit';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/19
 * Email: tao351992257@163.com
 */
@HMRouter({ pageUrl: 'Computed' })
@ComponentV2
export struct Page {
  @Local firstName: string = 'Hua';
  @Local lastName: string = 'Li';
  @Local showFullNameRequestCount: number = 0;
  private fullNameRequestCount: number = 0;

  @Computed
  get fullName() {
    console.info('fullName');
    // 不建议在@Computed的计算中做赋值逻辑，因为@Computed本质是一个getter访问器，用来节约重复计算
    // 在这个例子中，fullNameRequestCount仅代表@Computed计算次数，不能代表fullName被访问的次数
    this.fullNameRequestCount++;
    return this.firstName + ' ' + this.lastName;
  }

  build() {
    Column() {
      Text(`${this.fullName}`) // 获取一次fullName
        .fontSize(20)
        .margin(10)
      Text(`${this.fullName}`) // 获取一次fullName，累计获取两次fullName，但是fullName不会重新计算，读取缓存值
        .fontSize(20)
        .margin(10)
      // 点击Button，获取fullNameRequestCount次数
      Text(`count ${this.showFullNameRequestCount}`)
        .fontSize(20)
        .margin(10)
      Button('get fullName')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.showFullNameRequestCount = this.fullNameRequestCount;
        })
    }
    .width('100%')
  }
}


const TAG = '[Sample_Textcomponent]';
const DOMAIN = 0xF811;
const BUNDLE = 'Textcomponent_';

@HMRouter({ pageUrl: '@ComputedExample02' })
@ComponentV2
export struct CustomComponentUse {
  @Local firstName: string = 'Li';
  @Local lastName: string = 'Hua';
  age: number = 20; // 无法触发Computed

  @Computed
  get fullName() {
    hilog.info(DOMAIN, TAG, BUNDLE + '---------Computed----------');
    return `${this.firstName} '' ${this.lastName} ${this.age}`
  }

  build() {
    Column() {
      Text(this.lastName + ' ' + this.firstName)
        .fontSize(20)
        .margin(10)
      Text(this.lastName + ' ' + this.firstName)
        .fontSize(20)
        .margin(10)
      Divider()
      Text(this.fullName)
        .fontSize(20)
        .margin(10)
      Text(this.fullName)
        .fontSize(20)
        .margin(10)
      Button('changed lastName')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.lastName += 'a';
        })
      Button('changed age')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.age++; // 无法触发Computed
        })
    }
  }
}

@ObservedV2
class User {
  @Trace first = 'Zhang'
  @Trace last = 'San'

  get fullName(): string {
    return `${this.first}} ${this.last}}`
  }
}

