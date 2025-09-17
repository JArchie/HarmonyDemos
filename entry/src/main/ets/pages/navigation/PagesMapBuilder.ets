import { PageConstant } from "../../constants/PageConstant";
import { MainPage } from "../MainPage";
import { OtherPage } from "../OtherPage";
import { PrivacyPopupWindowPage } from "../splash/PrivacyPopupWindowPage";
import { SplashPage } from "../splash/SplashPage";

@Builder
export function PagesMapBuilder(name: string) {
  if (name === PageConstant.PAGE_SPLASH) {
    SplashPage()
  } else if (name === PageConstant.PAGE_PRIVACY_POPUP_WINDOW) {
    PrivacyPopupWindowPage()
  } else if (name === PageConstant.PAGE_MAIN) {
    MainPage()
  } else if (name === PageConstant.PAGE_OTHER) {
    OtherPage()
  }
}