import { Login } from '../pages/Login'
import { Home } from './Home'
import { Operation } from './Operation'
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
          Home()
        }.tabBar("景点")
        .borderColor("#36cfc9")

        TabContent(){
          Operation()
        }.tabBar("活动")
        .borderColor("#36cfc9")

        TabContent(){
          PersonalCenter()
        }.tabBar("我的")
        .borderColor("#36cfc9")

      }

    }.height("100%")
    .width("100%")


  }
}