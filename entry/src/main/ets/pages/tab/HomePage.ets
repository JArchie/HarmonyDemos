import { StatusBarComponent } from "../../components/StatusBarComponent"
import { CommonConstant } from "../../constants/CommonConstant"

@Component
export struct HomePage {
  build() {
    Column() {
      StatusBarComponent()
      Column() {
        Text($r('app.string.tab_index'))
          .fontSize($r('app.float.fp_20'))
          .fontColor($r('app.color.color_primary'))
          .fontWeight(FontWeight.Bold)
      }.layoutWeight(CommonConstant.WEIGHT_1)
      .justifyContent(FlexAlign.Center)
    }
    .width(CommonConstant.FULL_PERCENT)
    .height(CommonConstant.FULL_PERCENT)
  }
}