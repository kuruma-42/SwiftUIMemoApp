//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by Yong Jun Cha on 2021/05/24.
//

import SwiftUI

class Memo: Identifiable, ObservableObject {
    let id : UUID
    // Published 추가시 새로운 값이 저장될 때 마다 바인딩 돼있는 UI가 자동으로 업데이트 된다.
    @Published var content: String
    let insertDate: Date
    
    init(id: UUID = UUID(), content : String, insertDate: Date = Date()) {
        self.id = id
        self.content = content
        self.insertDate = insertDate
        
    }
}



extension Memo: Equatable {
    static func == (lhs: Memo, rhs: Memo) -> Bool {
        return lhs.id == rhs.id
    }

}
