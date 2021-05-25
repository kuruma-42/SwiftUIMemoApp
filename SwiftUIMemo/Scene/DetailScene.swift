//
//  DetailScene.swift
//  SwiftUIMemo
//
//  Created by Yong Jun Cha on 2021/05/25.
//

import SwiftUI

struct DetailScene: View {
    @ObservedObject var memo : Memo
    
    @EnvironmentObject var store : MemoStore
    @EnvironmentObject var formatter : DateFormatter
    
    
    var body: some View {
        VStack{
            ScrollView{
                VStack {
                    HStack {
                        Text(self.memo.content)
                            .padding()
                        
                        Spacer()
                    }
                        
                    Text("\(self.memo.insertDate, formatter: formatter)").padding()
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
            }
        }
        .navigationBarTitle("메모 보기")
    }
}

struct DetailScene_Previews: PreviewProvider {
    static var previews: some View {
        DetailScene(memo : Memo(content: "SwiftUI"))
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
