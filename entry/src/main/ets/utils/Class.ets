/**
 * Desc:
 * @author 李锦涛
 * Created on 2026/9/4
 * Email: lijt@eetrust.com
 */
export class C {
  constructor(x: number) /* 第一个签名 */

  constructor(x: string) /* 第二个签名 */

  constructor(x: boolean)

  constructor(x: number | string | boolean) { /* 实现签名 */
  }

  // foo(x: number): void; /* 第一个签名 */

  foo(x: number, y: boolean): void;

  foo(x: string, y: boolean): void;

  foo(x: string, y: boolean): void;

  foo(x: string, y: boolean, z: string): void;

  foo(x: string, y: boolean, z: string, z2: string): void;

  foo(x: string, y: boolean, z: string, z2?: string, z3?: string): void;


  /* 第二个签名 */
  foo(x: number | string, y: boolean, z?: string, z2?: string, z3?: string): void { /* 实现签名 */
    console.debug("C Class x = " + x + ", y = " + y + ",z = " + z + ",z2 = " + z2 + ",z3 = " + z3 + "")
  }
}