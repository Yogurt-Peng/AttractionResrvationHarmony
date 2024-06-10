import { print } from '../api/Util'
import { Login } from '../pages/Login'
import { Home } from './Home'
import { OperationPg } from './OperationPg'
import { PersonalCenter } from './PersonalCenter'
import router from '@ohos.router'

@Entry
@Component
struct Index {

  private uname:string=globalThis.uname
  @State selectedIndex:number=0;

  build() {
    Column(){
      Tabs({
        barPosition:BarPosition.End
      }){
        TabContent(){
          if (this.selectedIndex==0){
            Home()
          }
        }.tabBar("景点")
        .borderColor("#36cfc9")

        TabContent() {
          if (this.selectedIndex == 1) {
            OperationPg()

          }
        }.tabBar("活动")
        .borderColor("#36cfc9")

        TabContent(){

          if (this.selectedIndex == 2) {
            PersonalCenter()
          }
        }.tabBar("我的")
        .borderColor("#36cfc9")

      }.onChange((idx)=>{
          this.selectedIndex=idx;
      })

    }.height("100%")
    .width("100%")


  }

  onPageShow(){
    print(JSON.stringify(globalThis.loginParams))
  }
}