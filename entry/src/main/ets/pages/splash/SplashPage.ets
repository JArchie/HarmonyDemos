import { CommonConstant } from "../../constants/CommonConstant"
import { PageConstant } from "../../constants/PageConstant"
import { PreferencesUtil } from "../../utils/PreferencesUtil"

@Component
export struct SplashPage {
  @Consume(CommonConstant.PAGEINFO_KEY) pageStack: NavPathStack

  // 延时2秒之后跳转到主页面
  startInterval() {
    setTimeout(() => {
      this.pageStack.replacePath({ name: PageConstant.PAGE_MAIN })
    }, CommonConstant.EXIT_TIME)
  }

  aboutToAppear(): void {
    let isAgree = PreferencesUtil.getSync(CommonConstant.PRIVACY_KEY, false)
    if (isAgree) {
      this.startInterval()
    } else {
      this.pageStack.pushPath({
        name: PageConstant.PAGE_PRIVACY_POPUP_WINDOW, onPop: (popInfo: PopInfo) => {
          if (popInfo && popInfo.result) {
            let flag = popInfo.result as string
            if (flag === CommonConstant.PRIVACY_AGREED) {
              this.startInterval()
            }
          }
        }
      }, false)
    }
  }

  build() {
    NavDestination() {
      Column() {
        Text($r('app.string.splash_content'))
          .fontSize($r('app.float.fp_20'))
          .fontColor(Color.Blue)
          .fontWeight(FontWeight.Bold)
      }
      .width(CommonConstant.FULL_PERCENT)
      .height(CommonConstant.FULL_PERCENT)
      .justifyContent(FlexAlign.Center)
    }.hideTitleBar(true)
  }
}