//
//  ContentView.swift
//  SwiftUIMemo
//
//  Created by Yong Jun Cha on 2021/05/24.
//

import SwiftUI

struct MemoListScene: View {
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var formatter: DateFormatter
    
    var body : some View {
        NavigationView {
            List(store.list){ memo in
                MemoCell(memo: memo)
            }
            .navigationBarTitle("내 메모")
        }
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}


