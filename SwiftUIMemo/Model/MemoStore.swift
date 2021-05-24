//
//  MemoStore.swift
//  SwiftUIMemo
//
//  Created by Yong Jun Cha on 2021/05/24.
//

import Foundation

class MemoStore: ObservableObject {
    // 배열을 업데이트할 때 마다 바인딩 돼있는 뷰도 함께 업데이트
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "Lorem Ipsum 1"),
            Memo(content: "Lorem Ipsum 2"),
            Memo(content: "Lorem Ipsum 3")
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo : Memo?, content : String) {
        guard let memo = memo else { return }
        memo.content = content
    }
    
    func delete(memo: Memo){
        self.list.removeAll { $0 == memo }
    }
    
    func delete(set: IndexSet) {
        for index in set{
            self.list.remove(at: index)
        }
    }
}
