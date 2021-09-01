//
//  UITextViewWithPlaceholder.swift
//  ToDoApplication
//
//  Created by Anton Patrushev on 1.09.21.
//

import UIKit

//TODO: fix placeholder issue
// 1. Currently they don't have placeholder on init (esy to fix)
// 2. Since placeholder is simulated via real TextView.value it may go into viewModel via binding

class UITextViewWithPlaceholder: UITextView, UITextViewDelegate {
    public var placeholder: String? = nil
    public var placeholderColor = UIColor.lightGray
    public var normalColor = UIColor.black
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == self.placeholderColor {
            textView.text = nil
            textView.textColor = self.normalColor
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = self.placeholder
            textView.textColor = self.placeholderColor
        }
    }
    
    private static func _build() -> UITextViewWithPlaceholder {
        let textView = UITextViewWithPlaceholder(frame: .zero)
        textView.delegate = textView
        
        return textView
    }
    
    static func build(placeholder: String? = nil, placeholderColor: UIColor = UIColor.lightGray) -> UITextViewWithPlaceholder {
        let textView = Self._build()
        
        textView.placeholder = placeholder
        textView.placeholderColor = placeholderColor
        
        return textView
    }
}
