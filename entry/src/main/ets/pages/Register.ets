import router from '@ohos.router'
import { sendRegisterRequest, Toast } from '../api/Util'
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct Register {
  private uname: string="wait"
  private upassword: string="wait123"
  private phone: string="17374382520"

  build() {
    // 行
    Row() {
      Column({ space: 20 }) {

        Image($rawfile("back.png")).width(20).height(20).onClick(() => {router.back()})

        Text("注册").fontSize(30).fontWeight(FontWeight.Bold)

        TextInput({ placeholder: "电话" }).height(50).margin({ top: 50, }).onChange((value: string) => {
          this.phone = value
        })

        TextInput({ placeholder: "用户名" }).height(50).onChange((value: string) => {
          this.uname = value
        })

        TextInput({ placeholder: "密码" }).height(50).type(InputType.Password).onChange((value: string) => {
          this.upassword = value
        })

        Button("同意协议并注册").width("100%").height(50) .margin({ top: 50, }) .backgroundColor("#36cfc9").fontSize(20).onClick(() => {

          sendRegisterRequest(
              {uname: this.uname,upassword: this.upassword,phone: this.phone },
              function (response) {
                console.log("请求成功: " + JSON.stringify(response.data));
                router.pushUrl({ url: "pages/Login" })
              },
              function (error) {
                console.log("请求失败: " +JSON.stringify(error.response.data));
                Toast(String(error.response.data.message))
              }
            );

            // axios({
            //   method: 'post',
            //   url: 'http://192.168.31.10:8080/Register',
            //   headers: {
            //     'Content-Type': 'application/x-www-form-urlencoded'
            //   },
            //   data: {
            //     uname: 'wait',
            //     upassword: 'wait123',
            //     phone: '17374382520'
            //   }
            // }).then(function (response) {
            //   console.log("请求成功: " + JSON.stringify(response.data));
            // }).catch(function (error) {
            //   console.log("请求失败: " + error);
            // });


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
    .backgroundImage($rawfile("register_bg.png"))
    .backgroundImageSize(ImageSize.Contain)
    .backgroundImagePosition(Alignment.Center)

  }
}

