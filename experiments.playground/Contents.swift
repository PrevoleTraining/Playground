//: Playground - noun: a place where people can play

import UIKit

enum BarButton {
    case done(title: String)
    case edit(title: String)
    
    func button() -> UIBarButtonItem {
        switch self {
        case .done(let title):
            return UIBarButtonItem(title: title, style: .done, target: nil, action: nil)
        case .edit(let title):
            return UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        }
    }
}

let done = BarButton.done(title: "Save")
let button = done.button()
