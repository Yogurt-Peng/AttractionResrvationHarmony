import { getAllOperation, print } from '../api/Util'
import { Operation } from '../entity/Entity'

@Entry
@Component
export struct OperationPg {

  @State private operations:Operation[]=[]

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
          .shadow({
            radius: 5,
            color: "#36cfc9",
            offsetX: vp2px(2),
            offsetY: vp2px(2)
          })


          if(this.operations.length!==0)
          {
            ForEach(this.operations, (item: Operation, index?: number) => { // 循环数组创建每一个Item

              operationCard({img:"bg1.jpg",desc:item.description,time:item.openingHours,label:item.name})
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
      (response)=> {
        const operationsData = response.data.data

        this.operations = operationsData.map((item: any) => {
          return new Operation(item.oId,item.aId,item.name,item.description,item.opeingHours,item.image,item.price)
        })

      },
      (error) => {
        print(error.data)
      }
    );

  }

}

@Component
struct operationCard {
  private img: string = "bg1.jpg";
  private time: string = "2024.6.8-2024.6.10";
  private label: string = "啤酒节";
  private desc:string="描述"

  build() {

    Column() {
      Row() {
        Image($rawfile(this.img)).width("100%").height(80).borderRadius(10).width(80)
        Column() {

          Text(this.label).fontWeight(FontWeight.Bold).fontSize(15).fontColor(Color.Black).margin({ left: 5, top: 5 })
          Text(this.desc)
            .fontWeight(FontWeight.Bold)
            .fontSize(13)
            .fontColor(Color.Black)
            .margin({ left: 5, top: 5 })
            .opacity(0.4)
            .width("70%")


          Text(this.time)
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

