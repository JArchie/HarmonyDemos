import { common } from "@kit.AbilityKit"
import { CommonConstant } from "../../constants/CommonConstant"
import { PreferencesUtil } from "../../utils/PreferencesUtil"

@Component
export struct PrivacyPopupWindowPage {
  @Consume(CommonConstant.PAGEINFO_KEY) pageStack: NavPathStack
  private context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext

  build() {
    NavDestination() {
      Column() {
        Column() {
          Text($r('app.string.title_privacy_dialog'))
            .width(CommonConstant.FULL_PERCENT)
            .textAlign(TextAlign.Center)
            .fontSize($r('app.float.fp_18'))
            .fontColor($r('app.color.color_333'))
            .padding({ top: $r('app.float.vp_12'), bottom: $r('app.float.vp_12') })

          Divider().color(Color.Black).opacity(CommonConstant.OPACITY_01).strokeWidth(CommonConstant.VP_05)

          Text($r('app.string.privacy_content'))
            .width(CommonConstant.FULL_PERCENT)
            .textAlign(TextAlign.Center)
            .fontSize($r('app.float.fp_18'))
            .fontColor($r('app.color.color_333'))
            .padding({ top: $r('app.float.vp_16'), bottom: $r('app.float.vp_16') })

          Divider().color(Color.Black).opacity(CommonConstant.OPACITY_01).strokeWidth(CommonConstant.VP_05)

          Row() {
            Text($r('app.string.reject'))
              .layoutWeight(CommonConstant.WEIGHT_1)
              .padding({ top: $r('app.float.vp_12'), bottom: $r('app.float.vp_12') })
              .textAlign(TextAlign.Center)
              .fontSize($r('app.float.fp_18'))
              .fontColor($r('app.color.color_999'))
              .onClick(() => {
                this.pageStack.clear()
                this.context.terminateSelf()
              })

            Divider()
              .color(Color.Black)
              .opacity(CommonConstant.OPACITY_01)
              .strokeWidth(CommonConstant.VP_05)
              .height($r('app.float.vp_35'))
              .vertical(true)

            Text($r('app.string.agree'))
              .layoutWeight(CommonConstant.WEIGHT_1)
              .padding({ top: $r('app.float.vp_12'), bottom: $r('app.float.vp_12') })
              .textAlign(TextAlign.Center)
              .fontSize($r('app.float.fp_18'))
              .fontColor($r('app.color.color_primiry'))
              .onClick(() => {
                PreferencesUtil.putSync(CommonConstant.PRIVACY_KEY, true)
                this.pageStack.pop(CommonConstant.PRIVACY_AGREED, false)
              })
          }
        }.width(CommonConstant.PERCENT_70)
        .height(CommonConstant.PERCENT_25)
        .borderRadius($r('app.float.vp_8'))
        .backgroundColor(Color.White)
      }.width(CommonConstant.FULL_PERCENT)
      .height(CommonConstant.FULL_PERCENT)
      .justifyContent(FlexAlign.Center)
    }
    .mode(NavDestinationMode.DIALOG)
    .backgroundColor($r('app.color.color_transparent'))
    .hideTitleBar(true)
    .onBackPressed(() => {
      return true
    })
  }
}