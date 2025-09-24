import { CommonConstant } from "../../constants/CommonConstant"
import { PageConstant } from "../../constants/PageConstant"
import { DisplayUtil } from "../../utils/DisplayUtil"
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
      RelativeContainer() {
        Image($r('app.media.icon_splash')).width($r('app.float.vp_100')).height($r('app.float.vp_100')).objectFit(ImageFit.Contain)
          .alignRules({
            'top': { 'anchor': '__container__', 'align': VerticalAlign.Center },
            'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start },
            'right': { 'anchor': '__container__', 'align': HorizontalAlign.End }
          })
        Text($r('app.string.splash_content'))
          .width(CommonConstant.FULL_PERCENT)
          .textAlign(TextAlign.Center)
          .fontSize($r('app.float.fp_14'))
          .fontColor($r('app.color.color_primary'))
          .margin({ bottom: $r('app.float.vp_16') })
          .alignRules({
            'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
            'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start },
            'right': { 'anchor': '__container__', 'align': HorizontalAlign.End }
          })
      }
      .width(CommonConstant.FULL_PERCENT)
      .height(CommonConstant.FULL_PERCENT)
    }.hideTitleBar(true)
    .padding({ bottom: DisplayUtil.getBottomRectHeight(this.getUIContext()) })
  }
}