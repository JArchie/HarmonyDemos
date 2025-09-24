import { DisplayUtil } from "../utils/DisplayUtil";

@Component
export struct StatusBarComponent {
  build() {
    Blank().height(DisplayUtil.getTopRectHeight(this.getUIContext())).backgroundColor($r('app.color.color_primary'))
  }
}