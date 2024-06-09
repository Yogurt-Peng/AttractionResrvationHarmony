@Entry
@Component
export struct MyOperation {
  build() {


    Column() {
      Scroll() {

        Column({ space: 10 }) {

          Row() {
            Text("我的活动").fontSize(20).fontColor("#36cfc9")
          }
          .width("95%")
          .justifyContent(FlexAlign.Center)
          .borderRadius(10)
          .shadow({
            radius: 5,
            color: "#36cfc9",
            offsetX: vp2px(2),
            offsetY: vp2px(2)
          })


          MyOperInfo()
          MyOperInfo()
          MyOperInfo()
          MyOperInfo()
          MyOperInfo()
          MyOperInfo()

        }
        .alignItems(HorizontalAlign.Center) // 设置内容从左部开始
        .justifyContent(FlexAlign.Start)
        .width("90%")

      }.scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
      .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
      .scrollBar(BarState.Off) // 设置滚动条永久不显示

    }
    .width("100%")
    .height("100%")
    .alignItems(HorizontalAlign.Center) // 设置Column从顶部开始
    .justifyContent(FlexAlign.Center)
    .margin({ top: 10 })

  }
}


@Component
struct MyOperInfo {
  private name: string = "彭心瞬"
  private card: string = "433127200112172419"
  private phone: string = "17374382520"
  private date: string = "2024-6-9"
  private Id: number = 1
  private oname: string = "露营"

  build() {
    Column({ space: 10 }) {

      Row() {
        Text(this.name).fontWeight(FontWeight.Bold).fontSize(20)
        Text("    (待游玩)").fontWeight(FontWeight.Bold).fontSize(15).fontColor("#36cfc9")
      }

      Row() {
        Text("身份证号：").opacity(0.5)
        Text(this.card)
      }


      Row() {
        Text("手机号码：").opacity(0.5)
        Text(this.phone)
      }

      Row() {
        Text("游玩日期：").opacity(0.5)
        Text(this.date)
      }

      Row() {
        Text("活动名称：").opacity(0.5)
        Text(this.oname)
      }

      Row() {
        Text("预约号码：").opacity(0.5)
        Text(this.Id.toString())
      }

    }
    .width("95%")
    .alignItems(HorizontalAlign.Start) // 设置内容从左部开始
    .padding(20)
    .borderRadius(10)
    .shadow({
      radius: 20,
      color: Color.Grey,
      offsetX: vp2px(2),
      offsetY: vp2px(2)
    })

  }
}
