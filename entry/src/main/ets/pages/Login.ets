@Entry
@Component
struct Login {

  build() {
    // 行
    Row() {
      Column({space:20}) {

        Image($rawfile("back.png"))
          .width(20)
          .height(20)

        Text("登录")
          .fontSize(30)
          .fontWeight(FontWeight.Bold)


        TextInput({placeholder:"用户名"})
          .height(50)
          .margin({top:50,})

        TextInput({placeholder:"密码"})
          .height(50)
          .type(InputType.Password)

        Row(){
          Text("忘记密码?")
            .opacity(0.2)

        }.justifyContent(FlexAlign.End)
        .width("100%")

        Button("登录")
          .width("100%")
          .height(50)
          .margin({top:50,})
          .backgroundColor("#36cfc9")
          .fontSize(20)


        Row() {
          Text("没有账号? ")
          Text("注册")
            .margin({left: 5})  // Add some space between the two texts
            .fontColor("#36cfc9")
        }.width("100%")
        .justifyContent(FlexAlign.Center)
        .margin({top:150})

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

