import router from '@ohos.router'

@Entry
@Component
struct Register {
  build() {
    // 行
    Row() {
      Column({ space: 20 }) {

        Image($rawfile("back.png"))
          .width(20)
          .height(20)
          .onClick(() => {
            router.back()
          })

        Text("注册")
          .fontSize(30)
          .fontWeight(FontWeight.Bold)


        TextInput({ placeholder: "电话" })
          .height(50)
          .margin({ top: 50, })
        TextInput({ placeholder: "用户名" })
          .height(50)
        TextInput({ placeholder: "密码" })
          .height(50)
          .type(InputType.Password)

        Button("同意协议并注册")
          .width("100%")
          .height(50)
          .margin({ top: 50, })
          .backgroundColor("#36cfc9")
          .fontSize(20)
          .onClick(() => {
            router.pushUrl({ url: "pages/Login" })
          })

        Row() {
          Checkbox({ name: 'checkbox3', group: 'checkboxGroup' })
            .selectedColor('#36cfca')
            .onChange((value: boolean) => {
              console.info('Checkbox3 change is: ' + value)
            })
          Text('《注册协议》')
            .fontSize(14)
            .lineHeight(20)
            .fontColor('#182431')
            .fontWeight(500)
            .opacity(0.2)

        }.width("100%")
        .justifyContent(FlexAlign.Center) //内容居中


        Row() {
          Text("已经有账号? ")
          Text("登录")
            .margin({ left: 5 }) // Add some space between the two texts
            .fontColor("#36cfc9")
            .onClick(() => {
              router.pushUrl({ url: "pages/Login" })
            })
        }.width("100%")
        .justifyContent(FlexAlign.Center)
        .margin({ top: 150 })

      }
      .alignItems(HorizontalAlign.Start) // 设置内容从左部开始
      .justifyContent(FlexAlign.Start)
      .width("85%")
      .height("95%")

    }
    .height("100%")
    .width("100%")
    .alignItems(VerticalAlign.Center) // 设置Column从顶部开始
    .justifyContent(FlexAlign.Center)

  }
}

