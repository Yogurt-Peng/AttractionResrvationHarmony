import { getAllAttraction, getAllAttraction1, print, sleep, Toast, toUrl } from '../api/Util';
import { Attraction } from '../entity/Entity'
import router from '@ohos.router';


@Entry
@Component
export struct Home {

  // new Attraction(1,"1","1","1","1","1",2)
  @State attractions: Attraction[] = [] // 渲染

  private textArray: string[] = ["1", "2", "3", "4", "5"]

  build() {
    Row() {
      Scroll() {
        Column() {

          Stack({ alignContent: Alignment.TopStart }) {
            if (this.attractions.length !== 0) {
              Swiper() {

                ForEach(this.attractions, (item: Attraction, index?: number) => { // 循环数组创建每一个Item
                  if (index < 2) {
                    homeSwiperImage({ label: item.name, img: item.image, desc: item.description })
                  }
                })

              }.width("100%").height(300)
              .autoPlay(true)
              .indicatorStyle({ size: 20, color: "#36cfc9", selectedColor: Color.White, right: 0 })
            }


            Row() {
              Search({ placeholder: '你想去哪？' })
                .placeholderColor("#36cfc9")
                .backgroundColor(Color.White)
                .width("70%")
                .opacity(0.6)
            }.width("100%").justifyContent(FlexAlign.Center).margin({ top: 10 })

          }

          Text("最受欢迎的景点").fontWeight(FontWeight.Bold).fontSize(15).margin(15)

          Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {

            ForEach(this.attractions, (item: Attraction, index?: number) => { // 循环数组创建每一个Item

              homeAttractionImage({ attr: item })
                .onClick(() => {
                  router.pushUrl({
                    url: "pages/Reservation",
                    params: { attr: item } })
                })

            })

          }
          .width("100%")

        }
        .alignItems(HorizontalAlign.Start) // 设置内容从左部开始
        .width("100%")

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
    print("进入Home");
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

        // this.attractions.forEach(attraction => print(attraction.toString()));

      },
      (error) => {
        print(error.data)
      }
    )
  }
}


@Component
struct homeSwiperImage {
  private label: string;
  private img: string;
  private desc: string;

  build() {

    Stack({ alignContent: Alignment.TopStart }) {

      Image(toUrl(this.img)).width("100%").objectFit(ImageFit.Cover).height(300)
      Text(this.label).fontWeight(FontWeight.Bold).fontSize(30).fontColor(Color.White).margin({ left: 10, top: 200 })
      Text(this.desc).margin({ left: 10, top: 240 }).fontColor(Color.White)

    }

  }
}

@Component
struct homeAttractionImage {
  private attr: Attraction;

  build() {
    Column() {

      Image(toUrl(this.attr.image)).width("100%").height(150).borderRadius(10).objectFit(ImageFit.Cover)
      Text(this.attr.name).fontWeight(FontWeight.Bold).fontSize(15).fontColor(Color.Black).margin({ left: 5, top: 5 })
      Text(this.attr.openingHours)
        .fontWeight(FontWeight.Bold)
        .fontSize(13)
        .fontColor(Color.Black)
        .margin({ left: 5, top: 5 })
        .opacity(0.4)

    }
    .width("46%")
    .height(200)
    .borderRadius(10)
    .alignItems(HorizontalAlign.Start) // 设置内容从左部开始
    .shadow({
      radius: 20,
      color: Color.Grey,
      offsetX: vp2px(2),
      offsetY: vp2px(2)
    })
    .margin({ bottom: 10, left: 10 })

  }
}


