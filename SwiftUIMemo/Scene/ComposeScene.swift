//
//  ComposeScene.swift
//  SwiftUIMemo
//
//  Created by Yong Jun Cha on 2021/05/24.
//

import SwiftUI

struct ComposeScene: View {
    @EnvironmentObject var store: MemoStore
    @State private var content: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                //초기화 후, $표시 후 하면 바인딩이 된다.
                TextField("", text: $content)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle("새 메모", displayMode: .inline)
            .navigationBarItems(leading: DismissButton(), trailing: SaveButton())
        }
    }
}

fileprivate struct DismissButton: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("취소")
        })
    }
}

fileprivate struct SaveButton : View {
    var body: some View {
        Button(action: {}, label: {
            Text("저장")
        })
    }
}

struct ComposeScene_Previews: PreviewProvider {
    static var previews: some View {
        ComposeScene()
            .environmentObject(MemoStore())
    }
}
