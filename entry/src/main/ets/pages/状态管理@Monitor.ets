import { HMRouter } from '@hadss/hmrouter';
import { hilog } from '@kit.PerformanceAnalysisKit';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/18
 * Email: lijt@eetrust.com
 */

@HMRouter({ pageUrl: 'Monitor' })
@ComponentV2
export struct Index {
  @Local message: string = 'Hello World';
  @Local name: string = 'Tom';
  @Local age: number = 24;

  @Monitor('message', 'name')
  onStrChange(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      hilog.info(0xFF00, 'testTag', '%{public}s',
        `${path} changed from ${monitor.value(path)?.before} to ${monitor.value(path)?.now}`);
    });
  }

  build() {
    Column() {
      // 点击Button更新message和name，触发onStrChange回调
      Button('change string')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.message += '!';
          this.name += 'Jack';
        })
    }
    .width('100%')
  }
}