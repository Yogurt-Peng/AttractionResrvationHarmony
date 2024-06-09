import router from '@ohos.router'

@Entry
@Component
struct ForgotPassword {
  build() {
    Row() {
      Column({ space: 20 }) {

        Row() {
          Image($rawfile("back.png"))
            .width(20)
            .height(20)
            .margin({ top: 10 })
            .onClick(() => {
              router.back()
            })


          Text("忘记密码")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 90 })

        }
        .width("100%")
        .margin({ top: 20 })


        TextInput({ placeholder: "电话" })
          .height(50)
          .margin({ top: 120, })

        Button("发送")
          .width("100%")
          .height(50)
          .margin({ top: 10, })
          .backgroundColor("#36cfc9")
          .fontSize(20)


        Row() {
          Text("输入您的电话接受验证码重置您的密码")
            .opacity(0.6)
        }
        .width("100%")
        .justifyContent(FlexAlign.Center)
        .margin({ top: 120 })






      }
      .alignItems(HorizontalAlign.Start) // 设置内容从左部开始
      .justifyContent(FlexAlign.Start)
      .width("95%")
      .height("95%")
    }
    .height("100%")
    .width("100%")
    .alignItems(VerticalAlign.Center) // 设置Column从顶部开始
    .justifyContent(FlexAlign.Center)
    .backgroundImage($rawfile("ForgetPaw_bg.png"))
    .backgroundImageSize(ImageSize.Contain)
    .backgroundImagePosition(Alignment.Center)

  }
}