import { getAllAttraction, getAllOperation, print, toUrl } from '../api/Util'
import { Attraction, Operation } from '../entity/Entity'

@Entry
@Component
export struct OperationPg {
  @State private operations: Operation[] = []
  @State private attractions: Attraction[] = []

  build() {

    Row() {
      Scroll() {

        Column({ space: 10 }) {

          Row() {
            Text("活动").fontSize(20).fontColor("#36cfc9")
          }
          .width("100%")
          .justifyContent(FlexAlign.Center)
          .borderRadius(10)
          .shadow({ radius: 5, color: "#36cfc9", offsetX: vp2px(2), offsetY: vp2px(2) })

          if (this.operations.length !== 0 && this.attractions.length !== 0) {
            ForEach(this.operations, (i: Operation, index?: number) => { // 循环数组创建每一个Item

              ForEach(this.attractions, (j: Attraction, index?: number) => { // 循环数组创建每一个Item
                if (j.aid === i.aid) {
                  operationCard({ oper: i, aname: j.name })

                }
              })
            })
          }
        }
        .alignItems(HorizontalAlign.Center) // 设置内容从左部开始
        .justifyContent(FlexAlign.Start)
        .width("95%")
        .margin({ top: 10 })
        .padding(10)

      }
      .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
      .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
      .scrollBar(BarState.Off) // 设置滚动条永久不显示

    }
    .width("100%")
    .height("100%")
    .alignItems(VerticalAlign.Center) // 设置Column从顶部开始
    .justifyContent(FlexAlign.Center)

  }

  aboutToAppear() {
    print("进入Operation")

    getAllOperation(
      (response) => {
        const operationsData = response.data.data

        this.operations = operationsData.map((item: Operation) => {
          return new Operation(item.oid, item.aid, item.name, item.description, item.openingHours, item.image, item.price)
        })

        this.operations.forEach(operation => print(operation.toString()));

      },
      (error) => {
        print(error.data)
      }
    );

    getAllAttraction(
      (response) => {
        const attractionsData = response.data.data
        this.attractions = attractionsData.map((item: Attraction) => {
          return new Attraction(
            item.aid,
            item.name,
            item.location,
            item.description,
            item.openingHours,
            item.image,
            item.price
          );
        });

        this.attractions.forEach(attraction => print(attraction.toString()));


      },
      (error) => {
        print(error.data)
      }
    )


  }
}

@Component
struct operationCard {
  private oper: Operation
  private aname: string

  build() {

    Column() {
      Row() {
        Image(toUrl(this.oper.image)).width("100%").height(80).borderRadius(10).width(80)
        Column() {

          Text(this.oper.name + "(" + this.aname + ")")
            .fontWeight(FontWeight.Bold)
            .fontSize(15)
            .fontColor(Color.Black)
            .margin({ left: 5, top: 5 })

          Text(this.oper.description)
            .fontWeight(FontWeight.Bold)
            .fontSize(13)
            .fontColor(Color.Black)
            .margin({ left: 5, top: 5 })
            .opacity(0.4)
            .width("70%")


          Text(this.oper.openingHours)
            .fontWeight(FontWeight.Bold)
            .fontSize(13)
            .fontColor(Color.Black)
            .margin({ left: 5, top: 5 })
            .opacity(0.4)

        }
        .alignItems(HorizontalAlign.Start)

      }
      .width("100%")
      .borderRadius(10)
      .alignItems(VerticalAlign.Top)

    }
    .borderRadius(10)
    .shadow({
      radius: 20,
      color: Color.Grey,
      offsetX: vp2px(2),
      offsetY: vp2px(2)
    })

  }
}

