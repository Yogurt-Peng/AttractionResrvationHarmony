@Entry
@Component
export struct Operation {

  build() {
    Scroll(){

      Row() {
        Column() {

          Text("活动").fontSize(20).fontColor("#36cfc9")

          operationCard()
          operationCard()
          operationCard()
          operationCard()
          operationCard()
          operationCard()
          operationCard()

        }
        .alignItems(HorizontalAlign.Center)// 设置内容从左部开始
        .justifyContent(FlexAlign.Start)
        .width("95%")
        .margin({top:10})

      }
      .width("100%")
      .alignItems(VerticalAlign.Center)// 设置Column从顶部开始
      .justifyContent(FlexAlign.Center)


    } .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
    .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
    .scrollBar(BarState.Off)               // 设置滚动条永久不显示


  }
}

@Component
struct operationCard {

  private img: string="bg1.jpg";
  private aname:string="山东青岛"
  private time:string="2024.6.8-2024.6.10";
  private label: string="啤酒节";
  private address:string="青阳山"

  build() {

    Column(){
      Row(){
        Image($rawfile(this.img)).width("100%").height(100).borderRadius(10).width(100)
        Column(){
          Text(this.label).fontWeight(FontWeight.Bold).fontSize(15).fontColor(Color.Black).margin({left:5,top:5})
          Text(this.aname).fontWeight(FontWeight.Bold).fontSize(13).fontColor(Color.Black).margin({left:5,top:5}).opacity(0.4)
          Text(this.time).fontWeight(FontWeight.Bold).fontSize(13).fontColor(Color.Black).margin({left:5,top:5}).opacity(0.4)
          Text(this.address).fontWeight(FontWeight.Bold).fontSize(13).fontColor(Color.Black).margin({left:5,top:5}).opacity(0.4)
        }
        .alignItems(HorizontalAlign.Start)

      }
      .width("100%")
      .borderRadius(10)
      .alignItems(VerticalAlign.Top)

    }
    .padding(10)
    .margin({top:10})
    .borderRadius(10)
    .shadow({
      radius: 20,
      color: Color.Grey,
      offsetX: vp2px(2),
      offsetY: vp2px(2)
    })


  }
}

function oname(oname: any) {
throw new Error('Function not implemented.')
}
