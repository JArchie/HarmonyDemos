import { CommonConstant } from "../constants/CommonConstant"
import { PageConstant } from "../constants/PageConstant"
import { BackData, ParamData } from "../model/DemoData"

@Component
export struct FirstPage {
  @Consume(CommonConstant.PAGEINFO_KEY) pageStack: NavPathStack
  @State content: string | Resource = $r('app.string.tip_main_page')
  paramData: ParamData = { name: '我是FirstPage数据' }

  build() {
    NavDestination() {
      Column() {
        Text(this.content)
          .fontSize($r('app.float.fp_20'))
          .fontColor(Color.Blue)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            // 页面跳转，传递参数到Other页面，并通过onPop回调接收Other页面回传的数据
            this.pageStack.pushPath({
              name: PageConstant.PAGE_OTHER, param: this.paramData, onPop: (popInfo: PopInfo) => {
                let backData = popInfo.result as BackData
                this.content = backData.result
              }
            })
          })
      }
      .width(CommonConstant.FULL_PERCENT)
      .height(CommonConstant.FULL_PERCENT)
      .justifyContent(FlexAlign.Center)
    }.hideTitleBar(true)
  }
}