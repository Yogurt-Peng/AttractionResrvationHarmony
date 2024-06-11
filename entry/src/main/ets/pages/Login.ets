import router from '@ohos.router'
import { print, sendLoginRequest, Toast } from '../api/Util'

@Entry
@Component
export struct Login {
  private uname: string
  private upassword: string

  build() {
    // 行
    Row() {
      Column({ space: 20 }) {

        Image($rawfile("back.png")).width(20).height(20).onClick(() => {
          router.back()
        })


        Text("登录").fontSize(30).fontWeight(FontWeight.Bold)

        TextInput({ placeholder: "用户名" }).height(50).margin({ top: 50, }).onChange((value: string) => {
          this.uname = value
        })

        TextInput({ placeholder: "密码" }).height(50).type(InputType.Password).onChange((value: string) => {
          this.upassword = value
        })

        Row() {
          Text("忘记密码?").opacity(0.2).onClick(() => {
            router.pushUrl({ url: "pages/ForgotPassword" })
          })
        }.justifyContent(FlexAlign.End).width("100%")


        Button("登录")
          .width("100%")
          .height(50)
          .margin({ top: 50, })
          .backgroundColor("#36cfc9")
          .fontSize(20)
          .onClick(() => {

            sendLoginRequest({ uname: this.uname, upassword: this.upassword },
              function (response) {
                // console.log("请求失败: " +JSON.stringify(response.data));
                // print(JSON.stringify(response.data.data)) // 输出转换后的JavaScript对象
                globalThis.loginParams = { "user": response.data.data }
                router.pushUrl({ url: "pages/Index" })
              },
              function (error) {
                print(JSON.stringify(error.response.data));
                Toast(String(error.response.data.message))
              }
            );
          })


        Row() {
          Text("没有账号? ")
          Text("注册").margin({ left: 5 }).fontColor("#36cfc9").onClick(() => {
            router.pushUrl({ url: "pages/Register" })
          })

        }.width("100%").justifyContent(FlexAlign.Center).margin({ top: 150 })

      }
      .alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.Start).width("85%").height("95%")

    }
    .height("100%")
    .width("100%")
    .alignItems(VerticalAlign.Center) // 设置Column从顶部开始
    .justifyContent(FlexAlign.Center)
    .backgroundImage($rawfile("login_bg.png"))
    .backgroundImageSize(ImageSize.Contain)
    .backgroundImagePosition(Alignment.Center)

  }
}

