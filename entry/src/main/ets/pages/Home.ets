import { getAllAttraction, print, Toast } from '../api/Util';
import { Attraction } from '../entity/Attraction'

@Entry
@Component
export struct Home {


  @State private attractions:Attraction[]= []
  private textArray: string[] = ["1", "2", "3", "4", "5"]

  aboutToAppear(){
    print("进入Home")
    getAllAttraction(
      (response)=> {
        const attractionsData = response.data.data
        const attractions: Attraction[] = attractionsData.map((item: any) => {
          return new Attraction(
            item.aId,
            item.name,
            item.location,
            item.description,
            item.openingHours,
            item.image,
            item.price
          );
        });
        this.attractions= attractions; // 将数据存储到@State变量中
        this.attractions.forEach(attraction => print(attraction.name));

      },
      function(error) {
        print(error.data)
      }
    );

  }


  build() {

    Row() {
      Scroll() {
        Column() {

          Stack({ alignContent: Alignment.TopStart }) {

            Swiper() {

              // ForEach(this.textArray, (item: string, index?: number) => { // 循环数组创建每一个Item
              //   Text(`Text: ${index}`)                                     // 可以生成一个或多个子组件
              //     .fontSize(20)
              //     .backgroundColor(Color.Pink)
              //     .margin({ top: 10 })
              // })


              ForEach(this.attractions, (item: Attraction, index?: number) => { // 循环数组创建每一个Item
                if(index<2)
                {
                  homeSwiperImage({label:item.name,img:"bg1.jpg",desc:item.description})

                }
              })


            }.width("100%").height(300)
            .autoPlay(true)
            .indicatorStyle({ size: 20, color: "#36cfc9", selectedColor: Color.White, right: 0 })



            Row() {
              Search({ placeholder: '你想去哪？' })
                .placeholderColor("#36cfc9")
                .backgroundColor(Color.White)
                .width("70%")
                .opacity(0.6)
            }.width("100%").justifyContent(FlexAlign.Center).margin({ top: 10 })
          }

          Text("最受欢迎的景点").fontWeight(FontWeight.Bold).fontSize(15).margin(15)



            Row() {

            }
            .padding({ left: 5, right: 5 })
            .height(200)
            .width("100%")
            .justifyContent(FlexAlign.SpaceBetween) //两边撑满
            .margin({ top: 5 })



        }
        .alignItems(HorizontalAlign.Start) // 设置内容从左部开始
        .width("100%")

      }.scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
      .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
      .scrollBar(BarState.Off) // 设置滚动条永久不显示

    }
    .width("100%")
    .alignItems(VerticalAlign.Top) // 设置Column从顶部开始
    .justifyContent(FlexAlign.Center)
    .height("100%")


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
  private date: string;

  build() {
    Column() {

      Image($rawfile("bg1.jpg")).width("100%").height(150).borderRadius(10)
      Text("伦敦").fontWeight(FontWeight.Bold).fontSize(15).fontColor(Color.Black).margin({ left: 5, top: 5 })
      Text("2:00-24:00")
        .fontWeight(FontWeight.Bold)
        .fontSize(13)
        .fontColor(Color.Black)
        .margin({ left: 5, top: 5 })
        .opacity(0.4)

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
    .margin({ bottom: 10 })

  }
}



