// Script for compiling build behavior. It is built in the build plug-in and cannot be modified currently.
import { appTasks } from '@ohos/hvigor-ohos-plugin';
import { appPlugin } from "@hadss/hmrouter-plugin";

export default {
  system: appTasks,
  plugins: [appPlugin({ ignoreModuleNames: [ /** 不需要扫描的模块 **/ ] })]
};
