/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/9
 * Email: lijt@eetrust.com
 */
export abstract class BasicDataSource<T> implements IDataSource {
  private listeners: DataChangeListener[] = []

  abstract totalCount(): number

  abstract getData(index: number): T

  /**
   * 注册改变数据的控制器
   * @param listener
   */
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) > 0) {
      this.listeners.push(listener)
    }
  }

  /**
   * 注销改变数据的控制器
   * @param listener
   */
  unregisterDataChangeListener(listener: DataChangeListener): void {
    let index = this.listeners.indexOf(listener)
    if (index >= 0) {
      this.listeners.splice(index, 1)
    }
  }

  /**
   * 通知控制器数量增加
   * @param index
   */
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index)
    })
  }
}