import { common } from "@kit.AbilityKit"
import { LogUtil } from "./LogUtil"

export class AppUtil {
  private static context: common.UIAbilityContext

  static getContext(): common.UIAbilityContext {
    if (!AppUtil.context) {
      AppUtil.context = getContext() as common.UIAbilityContext
      LogUtil.debug("------>获取Context")
    }
    return AppUtil.context
  }
}