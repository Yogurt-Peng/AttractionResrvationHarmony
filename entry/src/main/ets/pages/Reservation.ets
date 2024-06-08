@Entry
@Component
export struct Reservation {

  build() {
    Row(){
      Column({space:15}) {
        Stack({ alignContent: Alignment.BottomStart }) {
          Image($rawfile("bg.jpg")).borderRadius(10)
            .shadow({
              radius: 20,
              color: Color.Grey,
              offsetX: vp2px(2),
              offsetY: vp2px(2)
            })
          Text("开普敦").fontSize(40).fontColor(Color.White).margin({ left: 10, bottom: 50 })

        }.height("200")

        Divider()

        Text("开普敦（Cape Town），南非第二大城市，南非立法首都，西开普省省会，开普敦都会城区的组成部分，南非国会及很多政府部门亦坐落于该市。").opacity(0.5)

        Text("请填写预约信息").fontColor(Color.Black).fontSize(20).opacity(0.7).fontWeight(FontWeight.Bold)
        TextInput({ placeholder: '请输入您的姓名' }).height(50).placeholderColor("#3592c4")
        TextInput({ placeholder: '请输入身份证号' }).height(50)
        TextInput({ placeholder: '请输入电话号码' }).height(50).placeholderColor("#499c54").type(InputType.PhoneNumber)
        TextInput({ placeholder: '请输入预约时间' }).height(50)

        Button("提交预约")
          .width("100%")
          .height(50)
          .backgroundColor("#36cfc9")
          .fontSize(20)


      }
      .alignItems(HorizontalAlign.Start)// 设置内容从左部开始
      .justifyContent(FlexAlign.Start)
      .width("95%")
      .height("95%")
      // .borderWidth(1)

    }
    .height("100%")
    .width("100%")
    .alignItems(VerticalAlign.Center)// 设置Column从顶部开始
    .justifyContent(FlexAlign.Center)
    .backgroundImageSize(ImageSize.Cover)
    .backgroundImage($rawfile("reservation_bg.jpg"))


  }
}