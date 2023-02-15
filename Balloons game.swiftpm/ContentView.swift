import SwiftUI

func RandomNum() -> CGFloat{
    return CGFloat(Int.random(in:-200...200))
}

struct ContentView: View {
    @State var HighScore = 0
    @State var PrevScore = 0
    @State var timeCount = 0.0
    @State var pause = false
    @State var randx1:CGFloat = RandomNum()
    @State var randy1:CGFloat = RandomNum()
    @State var Counter = 0
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            Image("Area")
                .resizable()
        VStack {
            Text("\(timeCount, specifier: "%.2f")")
                .onReceive(timer) { _ in
                    if pause == false {
                    if (timeCount < 10){
                        timeCount += 0.01
                        print(timeCount)
                    }}
                    else{
                        pause = true
                        print(timeCount)
                    }}
                    
            Button {
                if timeCount > 10{
                    if Counter > HighScore{
                        HighScore = Counter
                    }
                    PrevScore = Counter
                    timeCount = 0
                    Counter = 0
                    pause = false}
                if timeCount<10 {
                    print("button was tapped")
                    randx1 = RandomNum()
                    randy1 = RandomNum()
                    Counter += 1
                    
                }
                }label:{Image("Balloon")
                    .resizable()
                    .frame(width:50, height: 60)}
                .offset(x: CGFloat(randx1), y: CGFloat(randy1))
            
                    
                    
                    Text("score:")
                    Text(String(Counter))
            
            
            
                    
        }
            Text("Previous score:")
                .offset(x: 0, y: 200)
            Text(String(PrevScore))
                .offset(x: 0, y: 215)
            Text("High Score:")
                .offset(x: 0, y: 250)
            Text(String(HighScore))
                .offset(x:0,y:265)
        }
    }
}

