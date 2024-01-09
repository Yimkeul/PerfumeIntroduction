import SwiftUI

struct FirstTabView: View {
    @State private var showAnimation: Bool = false

    @State private var rotation: Angle = .degrees(0)

    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height


    struct bgEffect: Hashable {
        let xPos: CGFloat
        let yPos: CGFloat
        let rotate: Angle
    }


    var items: [bgEffect] = []
    var items2: [bgEffect] = []
    var top: CGFloat
    var bottom: Int

    init() {
        top = -(screenHeight / 2)
        bottom = Int(-top) - 100
        let canDraw: Int = Int(((screenWidth / 2) / 50) / 2)


        var xPos: CGFloat = 0
        for i in 0..<(canDraw * 2) {
            if i < canDraw {
                xPos = -CGFloat(i) * 120
            } else if i == canDraw {
                continue
            } else {
                xPos = CGFloat(i % canDraw) * 120
            }
            let yPos: CGFloat = CGFloat(bottom)
            let rotate = Angle.degrees(Double.random(in: 0..<360))
            items.append(bgEffect(xPos: xPos, yPos: yPos, rotate: rotate))
        }

        xPos = 0
        for i in 0..<(canDraw * 2) {
            if i < canDraw {
                xPos = -CGFloat(i) * 100
            } else if i == canDraw {
                continue
            } else {
                xPos = CGFloat(i % canDraw) * 100
            }
            let yPos: CGFloat = CGFloat(bottom - 100)
            let rotate = Angle.degrees(Double.random(in: 0..<360))
            items2.append(bgEffect(xPos: xPos, yPos: yPos, rotate: rotate))
        }
    }





    var body: some View {
        ZStack {
            ForEach(items, id: \.self) {
                item in
                Image(systemName: "drop.halffull")
                    .font(.system(size: 100, weight: .bold))
                    .rotationEffect(showAnimation ? item.rotate : .degrees(0))
                    .offset(x: item.xPos, y: showAnimation ? item.yPos : top)
                    .animation(
                        Animation.timingCurve(0.11, 0, 0.5, 0).speed(0.3)
                                                    .delay(1)
                    , value: showAnimation)
                    .onAppear() {
                    showAnimation = true
                }
            }
            ForEach(items2, id: \.self) {
                item in
                Image(systemName: "drop.halffull")
                    .font(.system(size: 100, weight: .bold))
                    .rotationEffect(showAnimation ? item.rotate : .degrees(0))
                    .offset(x: item.xPos, y: showAnimation ? item.yPos : top)
                    .animation(
                        Animation.timingCurve(0.11, 0, 0.5, 0).speed(0.3)
                            .delay(1.2)
                    , value: showAnimation)
                    .onAppear() {
                    showAnimation = true
                }
            }
            Text("Do you know perfume well?")
        }
    }
}