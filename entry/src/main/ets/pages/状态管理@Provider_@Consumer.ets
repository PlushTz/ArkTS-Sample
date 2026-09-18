import { HMRouter } from "@hadss/hmrouter";
import { BuilderNode, FrameNode, NodeController } from '@kit.ArkUI';

/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/18
 * Email: lijt@eetrust.com
 */
@HMRouter({ pageUrl: 'Provider$Consumer_01' })
@Entry
@ComponentV2
export struct Parent {
  @Provider() str: string = 'hello';

  build() {
    Column() {
      Button(this.str)
        .width(300)
        .margin(10)
        .onClick(() => {
          this.str += '0';
        })
      Child()
    }
    .width('100%')
  }
}

@ComponentV2
struct Child {
  // @Consumer装饰的属性str和Parent组件中@Provider装饰的属性str名称相同，因此建立了双向绑定关系
  @Consumer() str1: string = 'world';

  build() {
    Column() {
      Button(this.str1)
        .width(300)
        .margin(10)
        .onClick(() => {
          this.str1 += '1';
        })
    }
    .width('100%')
  }
}


@Builder
function buildText() {
  TestRemove()
}

let globalBuilderNode: BuilderNode<[]> | null = null;

class TextNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private uiContext: UIContext | null = null;

  constructor() {
    super();
  }

  makeNode(context: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(context);
    this.uiContext = context;
    return this.rootNode;
  }

  addBuilderNode(): void {
    if (globalBuilderNode === null && this.uiContext) {
      globalBuilderNode = new BuilderNode(this.uiContext);
      // 构建BuilderNode，TestRemove作为子组件
      globalBuilderNode.build(wrapBuilder<[]>(buildText), undefined, { enableProvideConsumeCrossing: true });
    }
    if (this.rootNode && globalBuilderNode) {
      this.rootNode.appendChild(globalBuilderNode.getFrameNode());
    }
  }

  removeBuilderNode(): void {
    if (this.rootNode && globalBuilderNode) {
      this.rootNode.removeChild(globalBuilderNode.getFrameNode());
    }
  }

  disposeNode(): void {
    if (this.rootNode && globalBuilderNode) {
      globalBuilderNode.dispose();
      globalBuilderNode = null;
    }
  }
}

@HMRouter({ pageUrl: 'RemoChildDisconnectProvider' })
@ComponentV2
export struct RemoChildDisconnectProvider {
  @Provider() content: string = 'Index: hello world';

  @Monitor('content')
  providerWatch() {
    console.info(`Provider change ${this.content}`);
  }

  controllerIndex: TextNodeController = new TextNodeController();

  build() {
    Column({ space: 8 }) {
      Text(`Provider: ${this.content}`)
        .fontSize(20)
        .margin(10)

      // 添加BuilderNode，@Consumer与@Provider建立双向同步
      Button('add child')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.controllerIndex.addBuilderNode();
        })

      // 移除BuilderNode，@Consumer与@Provider断开连接，恢复默认值
      Button('remove child')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.controllerIndex.removeBuilderNode();
        })

      // 释放BuilderNode的子节点TestRemove，随后该子节点销毁，触发子节点的aboutToDisappear回调
      Button('dispose child')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.controllerIndex.disposeNode();
        })

      // @Provider/@Consumer双向同步更新
      Button('change Provider')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.content += 'Pro';
        })
      NodeContainer(this.controllerIndex)
    }
    .width('100%')
    .height('100%')
  }
}

@ComponentV2
struct TestRemove {
  @Consumer() content: string = 'default value';

  @Monitor('content')
  consumerWatch() {
    console.info(`Consumer change ${this.content}`);
  }

  aboutToDisappear() {
    console.info(`TestRemove aboutToDisappear`);
  }

  build() {
    Column() {
      Text('Consumer ' + this.content)
        .fontSize(20)
        .margin(10)

      // @Provider和@Consumer绑定的Text组件刷新，并回调@Provider和@Consumer的@Monitor方法
      Button('change cc')
        .width(300)
        .margin(10)
        .onClick(() => {
          this.content += 'cc';
        })
    }
    .width('100%')
  }
}