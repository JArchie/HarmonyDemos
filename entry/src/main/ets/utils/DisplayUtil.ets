import { display } from "@kit.ArkUI"

export class DisplayUtil {
  static getDefaultDisplaySync(): display.Display {
    return display.getDefaultDisplaySync()
  }

  // 获取当前屏幕的宽
  static getWidth(): number {
    return DisplayUtil.getDefaultDisplaySync().width
  }

  // 获取当前屏幕的高
  static getHeight(): number {
    return DisplayUtil.getDefaultDisplaySync().height
  }

  static getTopRectHeight(context: UIContext): number {
    return context.px2vp(AppStorage.get<number>('topRectHeight') as number)
  }

  static getBottomRectHeight(context: UIContext): number {
    return context.px2vp(AppStorage.get<number>('bottomRectHeight') as number)
  }
}