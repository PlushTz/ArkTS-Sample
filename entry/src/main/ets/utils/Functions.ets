/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/4
 * Email: lijt@eetrust.com
 */

// 函数类型
export type trigFunc = (x: number) => number | void;

export function doAction(func: trigFunc) {
  // 调用函数func等价于kotlin中的invoke
  func(3.14)
}

let sum = (x: number, y: number): number => {
  return x + y;
}

export function f(): () => number {
  let count = 0;
  let g = (): number => {
    count++;
    return count
  }

  return g;
}


function sort(conditions: (a: number, b: number) => number) {

}




