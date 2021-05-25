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
    
    @Binding var showComposer: Bool
    
    
    var body: some View {
        NavigationView {
            VStack {
                //초기화 후, $표시 후 하면 바인딩이 된다.
                TextField("", text: $content)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle("새 메모", displayMode: .inline)
            .navigationBarItems(leading: DismissButton(show: $showComposer), trailing: SaveButton(show: $showComposer))
        }
    }
}

fileprivate struct DismissButton: View {
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            self.show = false
        }, label: {
            Text("취소")
        })
    }
}

fileprivate struct SaveButton : View {
    @Binding var show: Bool
    
    var body: some View {
        Button(action: {
            self.show = false
        }, label: {
            Text("저장")
        })
    }
}

struct ComposeScene_Previews: PreviewProvider {
    static var previews: some View {
        ComposeScene(showComposer: .constant(false))
            .environmentObject(MemoStore())
    }
}
