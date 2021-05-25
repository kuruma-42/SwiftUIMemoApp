//
//  ComposeScene.swift
//  SwiftUIMemo
//
//  Created by Yong Jun Cha on 2021/05/24.
//

import SwiftUI

struct ComposeScene: View {
    @EnvironmentObject var keyboard: KeyboardObserver
    @EnvironmentObject var store: MemoStore
    @State private var content: String = ""
    
    @Binding var showComposer: Bool
    
    
    var body: some View {
        NavigationView {
            VStack {
                //초기화 후, $표시 후 하면 바인딩이 된다.
                TextView(text: $content)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.bottom, keyboard.context.height)
                    .animation(.easeInOut(duration: keyboard.context.animationDuration))
//                    .background(Color.yellow)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle("새 메모", displayMode: .inline)
            .navigationBarItems(leading: DismissButton(show: $showComposer), trailing: SaveButton(show: $showComposer, content: $content))
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
    @EnvironmentObject var store : MemoStore
    @Binding var content : String
    
    
    var body: some View {
        Button(action: {
            self.store.insert(memo: self.content)
            
            
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
            .environmentObject(KeyboardObserver())
    }
}
