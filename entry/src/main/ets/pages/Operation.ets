@Entry
@Component
export struct Operation {

  build() {
    Row() {
      Column() {


        operationCard()

        operationCard()


      }
      .alignItems(HorizontalAlign.Start)// 设置内容从左部开始
      .justifyContent(FlexAlign.Start)
      .width("95%")
      .height("95%")
      // .borderWidth(1)

    }
    .height("100%")
    .width("100%")
    .alignItems(VerticalAlign.Center)// 设置Column从顶部开始
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct operationCard {
  private label: string;
  private img: string;
  private date:string;

  build() {

    Column(){
      Row(){
        Image($rawfile("bg1.jpg")).width("100%").height(100).borderRadius(10).width(100)
        Column(){
          Text("啤酒节").fontWeight(FontWeight.Bold).fontSize(15).fontColor(Color.Black).margin({left:5,top:5})
          Text("山东青岛").fontWeight(FontWeight.Bold).fontSize(13).fontColor(Color.Black).margin({left:5,top:5}).opacity(0.4)
          Text("青阳山").fontWeight(FontWeight.Bold).fontSize(13).fontColor(Color.Black).margin({left:5,top:5}).opacity(0.4)
          Text("2024.6.8-2024.6.10").fontWeight(FontWeight.Bold).fontSize(13).fontColor(Color.Black).margin({left:5,top:5}).opacity(0.4)
        }
        .alignItems(HorizontalAlign.Start)

      }
      .width("100%")
      .borderRadius(10)
      .alignItems(VerticalAlign.Top)

      Divider().margin({top:5,bottom:10})

    }



  }
}

