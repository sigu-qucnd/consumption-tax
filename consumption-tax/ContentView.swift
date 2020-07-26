//
//  ContentView.swift
//  consumption-tax
//
//  Created by Ryo Nagasawa on 2020/07/27.
//  Copyright © 2020 Ryo Nagasawa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var titleLabel = "consumption"
    
    var body: some View {
         NavigationView {
            VStack {
                Text(titleLabel).font(.title).foregroundColor(.orange).padding()
                HStack {
                    NavigationLink(destination:
                        ConsumptionView()) {
                            TextWithBorder(text: "play").foregroundColor(.green)
                        }
                    NavigationLink(destination:
                        InfoView()) {
                            TextWithBorder(text: "info").foregroundColor(.blue)
                        }
                }
            }
        }
    }
}

struct TextWithBorder: View {
    var text: String
    
    var body:some View {
        Text(text)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
    }
}

struct InfoView : View {
     @State var titleinfo = "info"
        var body: some View {
            VStack {
                Text(titleinfo).font(.title).foregroundColor(.orange).padding()
                Text("このアプリは消費税の計算用のiPhoneアプリとなります。\n使い方は「play」をタップし元の金額を入力します。入力後画面に消費税込みの金額が表示されます。")
            }
        
        }
}

struct ConsumptionView : View {
    @State var playtitle = "play"
    @State private var consumption = ""
    @State private var consumptionMessage = ""
    
    var body: some View {
        VStack {
                Text(playtitle).font(.title).foregroundColor(.orange).padding()
            TextField("入力値", text: $consumption,
            onCommit: {
                self.consumptionMessage = "消費税込みは、\(self.consumption)円です。"   //
                
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())  // 入力域のまわりを枠で囲む
                .padding().keyboardType(.numberPad)
            Text(consumptionMessage)// 余白を追加
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
