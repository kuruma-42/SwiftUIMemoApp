//
//  KeyboardObserver.swift
//  SwiftUIMemo
//
//  Created by Yong Jun Cha on 2021/05/25.
//

import UIKit
import Combine

class KeyboardObserver: ObservableObject{
    struct Context {
        let animationDuration : TimeInterval
        let height : CGFloat
        
        static let hide = Self(animationDuration: 0.25, height: 0)
    }
    @Published var context = Context.hide
    private var canclelables = Set<AnyCancellable>()
    
    init() {
        let willShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        let willHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        
        willShow.merge(with: willHide)
            .compactMap(parse)
            .assign(to: \.context, on :self)
            .store(in: &canclelables)
    }
    
    func parse(notification : Notification) -> Context?{
        guard let userInfo = notification.userInfo else { return nil }
        let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets
        let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0.25
        
        var height : CGFloat = 0
        
        if let value = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let frame = value.cgRectValue
            
            if frame.origin.y < UIScreen.main.bounds.height {
                height = frame.height - (safeAreaInsets?.bottom ?? 0)
            }
        }
        
        return Context(animationDuration: animationDuration, height: height)
        
    }
}
