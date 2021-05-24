//
//  DateFormatter+Memo.swift
//  SwiftUIMemo
//
//  Created by Yong Jun Cha on 2021/05/24.
//

import Foundation

extension DateFormatter {
    static let memoDateFormatter: DateFormatter = {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .long
        dateformatter.timeStyle = .none
        dateformatter.locale = Locale(identifier: "Ko_kr")
        return dateformatter
    }()
}

extension DateFormatter : ObservableObject {
    
}
