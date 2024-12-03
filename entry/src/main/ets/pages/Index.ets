//Scroller基础
@Entry
@Component
struct Index {
  build() {
    Column() {
      Scroll() {
        Column({ space: 10 }) {
          ForEach(Array.from({ length: 5 }), (item: string, index) => {
            Text('项目' + (index + 1))
              .width('100%')
              .height(100)
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.Red)
              .fontSize(20)
              .fontColor(Color.White)
              .borderRadius(10)
          })
        }
      }
      .padding(10)
      .width('100%')
      .height(300)
    }
  }
}


///////////////////////////////////////////////////////////////
//添加滚动条和滚动控制
@Entry
@Component
struct Index {
  build() {
    Column() {
      Scroll() {
        Column({ space: 10 }) {
          ForEach(Array.from({ length: 10 }), (item: string, index) => {
            Text('项目' + (index + 1))
              .width('100%')
              .height(100)
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.Blue)
              .fontSize(20)
              .fontColor(Color.White)
              .borderRadius(10)
          })
        }
        .padding(10)
        .width('100%')
      }
      .width('100%')
      .height(400)
      .scrollable(ScrollDirection.Vertical) // 设置滚动方向
      .scrollBar(BarState.Auto) // 设置滚动条显示策略
      .scrollBarColor(Color.Green) // 设置滚动条颜色
      .scrollBarWidth(5) // 设置滚动条宽度
      .edgeEffect(EdgeEffect.Spring) // 设置滑动效果
    }
  }
}


////////////////////////////////////////////
//监听滚动事件
@Entry
@Component
struct Index {
  myScroll: Scroller = new Scroller()

  build() {
    Column() {
      Scroll(this.myScroll) {
        Column({ space: 10 }) {
          ForEach(Array.from({ length: 10 }), (item: string, index) => {
            Text('项目' + (index + 1))
              .width('100%')
              .height(100)
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.Green)
              .fontSize(20)
              .fontColor(Color.White)
              .borderRadius(10)
          })
        }
        .padding(10)
        .width('100%')
      }
      .width('100%')
      .height(400)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .scrollBarColor(Color.Blue)
      .scrollBarWidth(5)
      .edgeEffect(EdgeEffect.Spring)
      .onScroll((x, y) => {
        console.log('已经滑动的距离:', this.myScroll.currentOffset().yOffset)
      })
    }
  }
}


///////////////////////////////////////////////////////////
//控制滚动条位置
@Entry
@Component
struct Index {
  myScroll: Scroller = new Scroller()

  build() {
    Column() {
      Scroll(this.myScroll) {
        Column({ space: 10 }) {
          ForEach(Array.from({ length: 10 }), (item: string, index) => {
            Text('项目' + (index + 1))
              .width('100%')
              .height(100)
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.Purple)
              .fontSize(20)
              .fontColor(Color.White)
              .borderRadius(10)
          })
        }
        .padding(10)
        .width('100%')
      }
      .width('100%')
      .height(400)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .scrollBarColor(Color.Blue)
      .scrollBarWidth(5)
      .edgeEffect(EdgeEffect.Spring)

      Button('滚动到底部').margin(20)
        .onClick(() => {
          this.myScroll.scrollEdge(Edge.End)
        })
      Button('获取已经滚动的距离')
        .onClick(() => {
          const y = this.myScroll.currentOffset().yOffset
          AlertDialog.show({
            message: `y: ${y}`
          })
        })
    }
  }
}
