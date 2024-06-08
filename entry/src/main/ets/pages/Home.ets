@Entry
@Component
export struct Home {
  build() {
    Row() {
      Column() {

        Stack({ alignContent: Alignment.TopStart }) {
          Swiper() {
            homeSwiperImage({ label: "开普敦", img: "bg.jpg", desc: "神奇是它的代名词" })
            homeSwiperImage({ label: "非洲", img: "bg1.jpg", desc: "神奇是它的代名词" })

          }.width("100%").height(300)
          .autoPlay(true)
          .indicatorStyle({size: 20, color: "#36cfc9",selectedColor: Color.White,right: 0})

          Row() {
            Search({ placeholder: '你想去哪？' }).placeholderColor("#36cfc9").backgroundColor(Color.White).width("70%").opacity(0.6)
          }.width("100%").justifyContent(FlexAlign.Center).margin({ top: 10 })
        }

        Text("最受欢迎的景点").fontWeight(FontWeight.Bold).fontSize(15).margin(15)

        Row(){
          homeAttractionImage()
          homeAttractionImage()
        }
        .padding({left:5,right:5})
        .height(200)
        .width("100%").justifyContent(FlexAlign.SpaceBetween) //两边撑满
        .margin({top:5})


      }
      .alignItems(HorizontalAlign.Start) // 设置内容从左部开始
      .width("100%")
      .height("100%")


    }
    .height("100%")
    .width("100%")
    .alignItems(VerticalAlign.Top) // 设置Column从顶部开始
    .justifyContent(FlexAlign.Center)

  }
}


@Component
struct homeSwiperImage {
  private label: string;
  private img: string;
  private desc: string;

  build() {

    Stack({ alignContent: Alignment.TopStart }) {

      Image($rawfile(this.img)).width("100%")
      Text(this.label).fontWeight(FontWeight.Bold).fontSize(30).fontColor(Color.White).margin({ left: 10, top: 200 })
      Text(this.desc).margin({ left: 10, top: 240 }).fontColor(Color.White)

    }


  }
}

@Component
struct homeAttractionImage {
  private label: string;
  private img: string;
  private date:string;

  build() {
      Column(){

        Image($rawfile("bg1.jpg")).width("100%").height(150).borderRadius(10)
        Text("伦敦").fontWeight(FontWeight.Bold).fontSize(15).fontColor(Color.Black).margin({left:5,top:5})
        Text("2:00-24:00").fontWeight(FontWeight.Bold).fontSize(13).fontColor(Color.Black).margin({left:5,top:5}).opacity(0.4)

      }
      .width("49%")
      .height(200)
      .borderRadius(10)
      .alignItems(HorizontalAlign.Start) // 设置内容从左部开始
      .shadow({
        radius: 20,
        color: Color.Grey,
        offsetX: vp2px(2),
        offsetY: vp2px(2)
      })

  }
}



