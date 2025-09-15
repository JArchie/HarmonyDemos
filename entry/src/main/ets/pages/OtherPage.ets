import { CommonConstant } from "../constants/CommonConstant"
import { BackData, ParamData } from "../model/DemoData"

@Component
export struct OtherPage {
  @Consume(CommonConstant.PAGEINFO_KEY) pageStack: NavPathStack
  @State content: string | Resource = $r('app.string.tip_other_page')
  paramData: ParamData | undefined = undefined

  aboutToAppear(): void {
    this.paramData = this.pageStack.getParamByIndex(this.pageStack.size() - 1) as ParamData
    if (this.paramData) {
      this.content = this.paramData.name
    }
  }

  build() {
    NavDestination() {
      Column() {
        Text(this.content)
          .fontSize($r('app.float.fp_20'))
          .fontColor(Color.Blue)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            let backData = new BackData('我是Other数据')
            this.pageStack.pop(backData)
          })
      }
      .width(CommonConstant.FULL_PERCENT)
      .height(CommonConstant.FULL_PERCENT)
      .justifyContent(FlexAlign.Center)
    }.hideTitleBar(true)
    .onReady((context: NavDestinationContext) => {
      this.paramData = context.pathInfo.param as ParamData
      if (this.paramData) {
        this.content = this.paramData.name
      }
    })
  }
}