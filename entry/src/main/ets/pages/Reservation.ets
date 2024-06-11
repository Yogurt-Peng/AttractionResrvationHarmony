import router from '@ohos.router';
import { print, sendLoginRequest, sendReservationRequest, Toast, toUrl } from '../api/Util';
import { Attraction, User } from '../entity/Entity';

@Entry
@Component
export struct Reservation {

  // 从3.1.6.5版本起，取值方式为：router.getParams()['key']
  private attr: Attraction = router.getParams()['attr'];
  private user: User = globalThis.loginParams.user
  private time: string
  private card: string

  build() {
    Row() {
      Column({ space: 10 }) {
        Stack({ alignContent: Alignment.BottomStart }) {
          Image(toUrl(this.attr.image)).borderRadius(10)
            .shadow({
              radius: 20,
              color: Color.Grey,
              offsetX: vp2px(2),
              offsetY: vp2px(2)
            })
          Text(this.attr.name).fontSize(40).fontColor(Color.White).margin({ left: 10, bottom: 50 })

        }.height("200")

        Divider()

        Text(this.attr.description).opacity(0.5).margin({ bottom: 50 })

        Text("请填写预约信息").fontColor(Color.Black).fontSize(20).opacity(0.7).fontWeight(FontWeight.Bold)
        // TextInput({ placeholder: '请输入您的姓名' }).height(50).placeholderColor("#3592c4")
        TextInput({ placeholder: '请输入身份证号' }).height(50)
          .onChange((value: string) => {
            this.card = value
          })
        // TextInput({ placeholder: '请输入电话号码' }).height(50).placeholderColor("#499c54").type(InputType.PhoneNumber)
        // TextInput({ placeholder: '请输入预约时间' }).height(50).type(InputType.Normal)
        //   .onChange((value: string) => {
        //     this.time = value
        //   })

        DatePicker({
          start: new Date('2020-1-1'), // 设置开始日期
          end: new Date('2025-1-1') // 设置结束日期
        })
          .width("100%")
          .height(60)
          .backgroundColor('#aabbcc')
          .onChange((date) => { // 设置事件回调
            // this.time = `${date.year}年${date.month}月${date.day}日`
            this.time = String(date.year) + "-" + String(date.month) + "-" + String(date.day)
            print(this.time)
          })
          .backgroundColor("#f1ede7")


        Button("提交预约")
          .width("100%")
          .height(50)
          .backgroundColor("#36cfc9")
          .fontSize(20)
          .onClick(() => {
            sendReservationRequest({
              uId: String(this.user.uid),
              aId: String(this.attr.aid),
              aname: this.attr.name,
              reservationTime: String(this.time),
              card: this.card
            },
              function (response) {
                print(JSON.stringify(response.data));
                Toast(String(response.data.message))

              },
              function (error) {
                print(JSON.stringify(error.response.data));
                Toast(String(error.response.data.message))
              }
            );


            // sendReservationRequest({ "uId": this.user.uid, "aId": this.attr.aid },
            //   (response) => {
            //     print(JSON.stringify(response.data.data)) // 输出转换后的JavaScript对象
            //     Toast(String(response.data.message))
            //   },
            //   (error) => {
            //     print(JSON.stringify(error.response.data));
            //     Toast(String(error.response.data.message))
            //   }
            // );
          })


      }
      .alignItems(HorizontalAlign.Start) // 设置内容从左部开始
      .justifyContent(FlexAlign.Start)
      .width("95%")
      .margin({ top: 10 })
      .padding(10)

    }
    .height("100%")
    .width("100%")
    .alignItems(VerticalAlign.Top) // 设置Column从顶部开始
    .justifyContent(FlexAlign.Center)
    .backgroundImageSize(ImageSize.Cover)
    .backgroundImage($rawfile("reservation_bg.jpg"))

  }
}