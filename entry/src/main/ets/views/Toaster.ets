import promptAction from '@ohos.promptAction';

export class Toaster {
  showToaster(message: string, bottom: string | number) {
    promptAction.showToast({ message: message, duration: 2000, bottom: bottom })
  }
}

let toaster = new Toaster();

export default toaster as Toaster;