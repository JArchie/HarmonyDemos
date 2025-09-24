import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit'
import { hilog } from '@kit.PerformanceAnalysisKit'
import { window } from '@kit.ArkUI'
import { LogUtil } from '../utils/LogUtil'

const DOMAIN = 0x0000

export default class EntryAbility extends UIAbility {
  onCreate(_want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT)
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate')
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy')
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate')

    windowStage.loadContent('pages/navigation/NavigationPage', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err))
        return
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.')
      // 使用同步方式获取应用主窗口
      let windowClass: window.Window = windowStage.getMainWindowSync()
      // 设置状态栏字体颜色
      windowClass.setWindowSystemBarProperties({
        statusBarContentColor: '#FFFFFF'
      })
      // 设置窗口全屏
      windowClass.setWindowLayoutFullScreen(true)
      // 获取布局避让遮挡的区域
      let topType = window.AvoidAreaType.TYPE_SYSTEM
      let topArea = windowClass.getWindowAvoidArea(topType)
      let topRectHeight = topArea.topRect.height
      AppStorage.setOrCreate('topRectHeight', topRectHeight)
      let bottomType = window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR
      let bottomArea = windowClass.getWindowAvoidArea(bottomType)
      let bottomRectHeight = bottomArea.bottomRect.height
      AppStorage.setOrCreate('bottomRectHeight', bottomRectHeight)
      // 注册监听函数，动态获取避让区域的实时数据
      windowClass.on('avoidAreaChange', (data) => {
        if (data.type === window.AvoidAreaType.TYPE_SYSTEM) {
          let topRectHeight = data.area.topRect.height
          AppStorage.setOrCreate('topRectHeight', topRectHeight)
        } else if (data.type == window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR) {
          let bottomRectHeight = data.area.bottomRect.height
          AppStorage.setOrCreate('bottomRectHeight', bottomRectHeight)
        }
      })
    })
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy')
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground')
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground')
  }
}