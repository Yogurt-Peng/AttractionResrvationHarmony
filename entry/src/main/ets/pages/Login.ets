
@Extend(Row) function  RowBorderColor(){
  .borderWidth(1)
  .borderColor(Color.Blue)

}


@Extend(Column) function  ColumnBorderColor(){
  .borderWidth(1)
  .borderColor(Color.Red)

}


@Entry
@Component
struct Login {
  @State message: string = 'Hello World'

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

        Row() {
          Text("忘记密码")
            .opacity(0.2)
            .fontSize(15)
        }
        .width("100%")
        .justifyContent(FlexAlign.End)

        Button("登录")
          .width("100%")
          .height(60)
          .margin({top:50,})
        .backgroundColor("#36cfc9")

        // Add a Row here to put the "还没有账号?" and "注册" texts side by side
        Row() {

          Text("还没有账号? ")
          Text("注册")
            .margin({left: 5})  // Add some space between the two texts
            .fontColor("#36cfc9")
        }.width("100%")
        .justifyContent(FlexAlign.Center)
        .margin({top:300})

      }
      .margin({top:40,left:20,right:20})
      .alignItems(HorizontalAlign.Start)
    }


  }
}

