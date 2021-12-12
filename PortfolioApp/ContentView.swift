import SwiftUI
import Combine
struct ContentView: View {
    @State var tensu = Int.random(in: 0...100)
    @State var usrins = ""
    @State var cnt = 0
    @State var nyuu = false
    @State var resultTensu:String = ""
    @State var tmpNum:Int = -1
    
    var body: some View{
     
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .yellow]),startPoint: .top, endPoint: .bottom).ignoresSafeArea()
           
            VStack{
                Text("点数を当ててください").font(.title2)
                Text("挑戦回数：\(cnt)回")
                TextField("0〜100",text: $usrins)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                //３文字を超えないように制御
                    .onReceive(Just(usrins)){ _ in
                        if usrins.count > 3 {
                            usrins = String(usrins.prefix(3))
                        }
                    }
                    .frame(width:140,height: 20)
                    .padding()
                //Checkボタン
                Button(action:{
                    if (Int(usrins) ?? 0) >= 0 {
                        //直前にCheckした数字の場合はカウントしない
                        if tmpNum != Int(usrins) ?? 0 {
                            cnt = cnt + 1
                            tmpNum = Int(usrins) ?? 0
                        }
                        if (Int(usrins) ?? 0) == tensu {
                            resultTensu = "あたり！\(cnt)回目"
                        } else if (Int(usrins) ?? 0) > tensu {
                            resultTensu = "\(tmpNum)より低い"
                        } else {
                            resultTensu = "\(tmpNum)より高い"
                        }
                    }
                }){
                    Text("CHECK!!")
                }//Button(Checkボタン)
                
                Text("\(resultTensu)")
                
                Button(action: {
                    tensu = Int.random(in: 0...100)
                    cnt = 0
                    nyuu = false
                    tmpNum = -1
                    resultTensu = ""
                    usrins = ""
                }){
                    Text("リセット")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
