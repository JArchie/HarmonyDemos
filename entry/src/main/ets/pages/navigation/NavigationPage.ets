import { CommonConstant } from '../../constants/CommonConstant'
import { PageConstant } from '../../constants/PageConstant'
import { PagesMapBuilder } from './PagesMapBuilder'
import { common } from '@kit.AbilityKit'

@Entry
@Component
struct NavigationPage {
  // 页面路由栈
  @Provide(CommonConstant.PAGEINFO_KEY) pageStack: NavPathStack = new NavPathStack()
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext
  private preTime: number = CommonConstant.PRE_TIME
  promptAction = this.getUIContext().getPromptAction()

  aboutToAppear(): void {
    this.pageStack.pushPath({ name: PageConstant.PAGE_MAIN }, false)
  }

  build() {
    Navigation(this.pageStack)
      .hideTitleBar(true)
      .hideToolBar(true)
      .hideNavBar(true)
      .mode(NavigationMode.Stack)
      .navDestination(PagesMapBuilder)
  }

  // 2秒内连续点按/侧滑后关闭当前应用
  onBackPress(): boolean | void {
    let currentTime = new Date().getTime()
    let flag = currentTime - this.preTime
    if (flag > CommonConstant.EXIT_TIME) {
      this.preTime = currentTime
      this.promptAction.showToast({ message: CommonConstant.EXIT_INFO })
      return true
    } else {
      this.context.terminateSelf()
    }
    return false
  }
}