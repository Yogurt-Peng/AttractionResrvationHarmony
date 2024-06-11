import { getMyAttraction, print } from '../api/Util'
import { Reservation, User } from '../entity/Entity'

@Entry
@Component
export struct MyOperation {
  private user: User = globalThis.loginParams.user
  @State private reservations: Reservation[] = []

  build() {

    Row() {
      Scroll() {

        Column({ space: 10 }) {
          Row() {
            Text("我的景点").fontSize(20).fontColor("#36cfc9")
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


          if (this.reservations.length > 0) {
            ForEach(this.reservations, (item: Reservation, index?: number) => { // 循环数组创建每一个Item
              MyReseInfo({ rese: item, user: this.user })
            })

          }

        }
        .alignItems(HorizontalAlign.Center) // 设置内容从左部开始
        .justifyContent(FlexAlign.Start)
        .width("95%")
        .margin({ top: 10 })
        .padding(10)

      }.scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
      .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
      .scrollBar(BarState.Off) // 设置滚动条永久不显示

    }

    .height("100%")
    .width("100%")
    .alignItems(VerticalAlign.Top) // 设置Column从顶部开始
    .justifyContent(FlexAlign.Center)

  }

  // 异步，同步，生命周期
  aboutToAppear() {
    print("MyAttraction")

    // getMyAttraction({ uId: "16" },
    getMyAttraction({ uId: String(this.user.uid) },
      (response) => {
        const reservationsData = response.data.data
        this.reservations = reservationsData.map((item: Reservation) => {
          return new Reservation(
            item.aid,
            item.rid,
            item.uid,
            item.aname,
            item.reservationTime,
            item.card
          )
        });

        this.reservations.forEach(reservation => print(reservation.toString()));

      },
      (error) => {
        print(error.data)
      }
    )
  }
}


@Component
struct MyReseInfo {
  private rese: Reservation
  private user: User

  build() {
    Column({ space: 10 }) {

      Row() {
        Text(this.user.uname).fontWeight(FontWeight.Bold).fontSize(20)
        Text("    (待游玩)").fontWeight(FontWeight.Bold).fontSize(15).fontColor("#36cfc9")
      }

      Row() {
        Text("身份证号：").opacity(0.5)
        Text(this.rese.card)
      }


      Row() {
        Text("手机号码：").opacity(0.5)
        Text(this.user.phone)
      }

      Row() {
        Text("游玩日期：").opacity(0.5)
        Text(this.rese.reservationTime)
      }

      Row() {
        Text("景点名称：").opacity(0.5)
        Text(this.rese.aname)
      }

      Row() {
        Text("预约号码：").opacity(0.5)
        Text(this.rese.rid.toString())
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
