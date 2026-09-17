import { HMRouter } from '@hadss/hmrouter';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/15
 * Email: lijt@eetrust.com
 */
@HMRouter({ pageUrl: 'LocalDecorator' })
@ComponentV2
export struct LocalDecorator {
  @Local count?: number = 0
  @Local message?: string = ''
  @Local flag?: boolean = false

  build() {
    Column() {
      Text(`${this.count}`)
      Text(`${this.message}`)
      Text(`${this.flag}`)
      Button('change local').onClick((event: ClickEvent) => {
        if (this.count != null || this.count != undefined) {
          this.count++
        }

        if (this.message != undefined) {
          this.message = 'Hello'
        }

        if (this.flag != undefined) {
          this.flag = true
        }

      })
    }
  }
}

@ComponentV2
struct TaskItem {
  @Param taskName: string = '';
  @Param @Once isFinish: boolean = false;
  @Event deleteTask: () => void = () => {
  };

  build() {
    Row() {
      // 请开发者自行在src/main/resources/base/media路径下添加finished.png和unfinished.png两张图片，否则运行时会因资源缺失而报错。
      // Image(this.isFinish ? $r('app.media.finished') : $r('app.media.unfinished'))
      //   .width(28)
      //   .height(28)
      Text(this.taskName)
        .decoration({ type: this.isFinish ? TextDecorationType.LineThrough : TextDecorationType.None })
      Button('Delete')
        .onClick(() => {
          this.deleteTask();
        })
    }
    .onClick(() => {
      this.isFinish = !this.isFinish;
    })
  }
}

@HMRouter({ pageUrl: 'TodoList' })
@ComponentV2
export struct TodoList {
  @Local tasks: string[] = ['task1', 'task2', 'task3'];
  @Local newTaskName: string = '';

  build() {
    Column() {
      Text('To do')
        .fontSize(40)
        .margin({ bottom: 10 })
      ForEach(this.tasks, (task: string) => {
        TaskItem({
          taskName: task,
          isFinish: false,
          deleteTask: () => {
            this.tasks.splice(this.tasks.indexOf(task), 1);
          }
        })
      })
      Row() {
        TextInput({ placeholder: 'Add new tasks', text: this.newTaskName })
          .onChange((value) => {
            this.newTaskName = value;
          })
          .width('70%')
        Button('+')
          .onClick(() => {
            this.tasks.push(this.newTaskName);
            this.newTaskName = '';
          })
      }
    }
  }
}

@ObservedV2
class Info {
  @Trace name: string
  @Trace age: number

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

@HMRouter({ pageUrl: 'LocalTraceExample' })
@ComponentV2
export struct LocalTraceExample {
  @Param @Once info: Info = new Info('Tom', 25);
  @Local localInfo: Info = new Info('Tom', 25);

  build() {
    Row() {
      Column() {
        Text(`info: ${this.info.name}-${this.info.age}`) // Text1
          .margin(10)
        Text(`localInfo: ${this.localInfo.name}-${this.localInfo.age}`) // Text2
          .margin(10)
        Button('change info&localInfo')
          .onClick(() => {
            this.info = new Info('Lucy', 18); // Text1不会刷新
            this.localInfo = new Info('Lucy', 18); // Text2会刷新
          })
          .margin(10)
      }
      .width('100%')
    }
    .height('100%')
  }
}

@ComponentV2
struct ChildComponent {
  // @Once装饰的onceParam仅初始化同步一次
  @Param @Once onceParam: string = '';

  build() {
    Column() {
      Text(`onceParam: ${this.onceParam}`)
        .fontSize(20)
        .margin(10)
    }
    .width('100%')
  }
}

@HMRouter({ pageUrl: 'MyComponent' })
@ComponentV2
export struct MyComponent {
  // ...
  @Local message: string = 'Hello World';

  build() {
    Column() {
      Text(`Parent message: ${this.message}`)
        .fontSize(20)
        .margin(10)
      Button('change message')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.message = 'Hello Tomorrow';
        })
      ChildComponent({ onceParam: this.message })
    }
    .width('100%')
  }
}