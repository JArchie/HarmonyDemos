// MainPage传递参数的数据类
export interface ParamData {
  name: string
}

// OtherPage回传的数据类
export class BackData {
  result?: string

  constructor(result: string) {
    this.result = result
  }
}