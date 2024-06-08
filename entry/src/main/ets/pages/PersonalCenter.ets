@Entry
@Component
export struct PersonalCenter {

  build() {
    Row() {
      Column() {

        Row(){
          Text("Daniel Hua")
            .fontSize(25)
            .fontWeight(FontWeight.Bold)

          Image($rawfile("avatar.jpg"))
            .width(70)
            .height(70)
            .shadow({
              radius: 20,
              color: Color.Grey,
              offsetX: vp2px(2),
              offsetY: vp2px(2)
            })

        }
        .width("100%")
        .margin({top:30})
        .justifyContent(FlexAlign.SpaceBetween) //两边撑满

        Text("曾经沧海难为水，除却巫山不是云。")
          .opacity(0.3)
        .fontSize(15)


        pcCreateButton({label:"我的预约",icon:"shoucang.png",color:Color.Blue ,textColor:Color.White}).margin({top:100})
        Divider()
        pcCreateButton({label:"我的活动",icon:"map.png",color:Color.Red ,textColor:Color.White});
        Divider()
        pcCreateButton({label:"设置",icon:"shezhi.png",color:Color.Green ,textColor:Color.White});
        Divider()
        pcCreateButton({label:"退出登录",icon:"huiji.png",color:Color.Transparent ,textColor:Color.White});
        Divider()

      }
      .alignItems(HorizontalAlign.Start)// 设置内容从左部开始
      .justifyContent(FlexAlign.Start)
      .width("85%")
      .height("95%")
    }
    .height("100%")
    .width("100%")
    .alignItems(VerticalAlign.Center)// 设置Column从顶部开始
    .justifyContent(FlexAlign.Center)

  }


}

@Component
struct pcCreateButton {
  private label:string;
  private icon: string ;
  private color: Color;
  private textColor:Color;

  build() {
    Button({type: ButtonType.Normal}) {
      Row() {
        Image($rawfile(this.icon))
          .width(30)
          .height(30)
          .margin({left: 0,right:15})
          .colorBlend(this.color)

        Text(this.label)
          .fontSize(20)
          .fontColor(Color.Black)
      }
      .width("100%")
    }
    .backgroundColor(this.textColor)
    .width("100%")
    .height(50)

  }
}
