import { CommonConstant } from "../../constants/CommonConstant"
import { TabInfo, tabInfos } from "../../model/MainPageData"
import { DisplayUtil } from "../../utils/DisplayUtil"
import { FinancialPage } from "./FinancialPage"
import { HomePage } from "./HomePage"
import { MessagePage } from "./MessagePage"
import { MinePage } from "./MinePage"
import { VideoPage } from "./VideoPage"

@Component
export struct MainPage {
  @State currentTabIndex: number = CommonConstant.TAB_INDEX

  build() {
    NavDestination() {
      Column() {
        Tabs({ index: this.currentTabIndex }) {
          TabContent() {
            HomePage()
          }

          TabContent() {
            FinancialPage()
          }

          TabContent() {
            VideoPage()
          }

          TabContent() {
            MessagePage()
          }

          TabContent() {
            MinePage()
          }
        }
        .barHeight(CommonConstant.TAB_BAR_HEIGHT)
        .scrollable(false)
        .layoutWeight(CommonConstant.WEIGHT_1)
        .onChange((index) => {
          this.currentTabIndex = index
        })

        this.BottomTabView()
      }
    }.hideTitleBar(true)
    .padding({ bottom: DisplayUtil.getBottomRectHeight(this.getUIContext()) })
  }

  @Builder
  BottomTabView() {
    Column() {
      Divider().width(CommonConstant.FULL_PERCENT).color(Color.Black)
        .opacity(CommonConstant.OPACITY_01).strokeWidth(CommonConstant.WEIGHT_1)
      Row() {
        ForEach(tabInfos, (button: TabInfo) => {
          this.TabItem(button)
        })
      }
      .width(CommonConstant.FULL_PERCENT)
      .height($r('app.float.vp_50'))
      .alignItems(VerticalAlign.Center)
      .backgroundColor(Color.White)
    }.width(CommonConstant.FULL_PERCENT)
  }

  @Builder
  TabItem(tabInfo: TabInfo) {
    Column() {
      Image(this.currentTabIndex === tabInfo.index ? tabInfo.selectImg : tabInfo.img)
        .objectFit(ImageFit.Contain)
        .width($r('app.float.vp_24'))
        .height($r('app.float.vp_24'))
        .margin({ bottom: $r('app.float.vp_5') })
      Text(tabInfo.title)
        .width(CommonConstant.FULL_PERCENT)
        .height($r('app.float.vp_16'))
        .fontSize($r('app.float.fp_12'))
        .textAlign(TextAlign.Center)
        .fontColor(this.currentTabIndex === tabInfo.index ? $r("app.color.color_primary") :
        $r('app.color.color_unselect'))
    }
    .width(CommonConstant.FULL_PERCENT)
    .height(CommonConstant.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
    .width(CommonConstant.PERCENT_20)
    .onClick(() => {
      this.currentTabIndex = tabInfo.index
    })
  }
}