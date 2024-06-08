import {Login} from "../pages/Login"
import { PersonalCenter } from './PersonalCenter'

@Entry
@Component
struct Index {

  build() {
    Column(){
      Tabs({
        barPosition:BarPosition.End
      }){
        TabContent(){
          Text("景点").fontSize(30)

        }.tabBar("景点")
        .borderColor("#36cfc9")

        TabContent(){
          Text("活动").fontSize(30)
        }.tabBar("活动")

        TabContent(){
          PersonalCenter()
        }.tabBar("我的")

      }

    }


  }
}