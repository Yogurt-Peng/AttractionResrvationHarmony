import router from '@ohos.router';
import { toUrl } from '../api/Util';
import { Attraction } from '../entity/Entity';

@Entry
@Component
export struct Reservation {

  // 从3.1.6.5版本起，取值方式为：router.getParams()['key']
  private attr: Attraction = router.getParams()['attr'];

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

        Text(this.attr.description).opacity(0.5).margin({ bottom: 80 })

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