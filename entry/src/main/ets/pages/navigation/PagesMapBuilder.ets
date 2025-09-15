import { PageConstant } from "../../constants/PageConstant";
import { MainPage } from "../MainPage";
import { OtherPage } from "../OtherPage";

@Builder
export function PagesMapBuilder(name: string) {
  if (name===PageConstant.PAGE_MAIN) {
    MainPage()
  }else if (name===PageConstant.PAGE_OTHER){
    OtherPage()
  }
}