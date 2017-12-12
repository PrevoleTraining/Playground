//: Playground - noun: a place where people can play

// Enums

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

// Optionals

struct Book {
    let title: String
    let author: String
    let price: String?
    let pubDate: String?
    
    init?(dict: [String: String]) {
        guard let title = dict["title"], let author = dict["author"] else {
            return nil
        }
        
        self.title = title
        self.author = author
        self.price = dict["price"]
        self.pubDate = dict["pubDate"]
    }
}

// Protocols

protocol User {
    var name: String { get }
    var age: Int { get set }
}

struct Person: User {
    var name: String
    var age: Int
}

let somePerson = Person(name: "John Doe", age: 12)

protocol ColorSwitchable {
    func switchColor(_ color: Color)
}

enum LightState {
    case on, off
}

enum Color {
    case rgb(Double, Double, Double, Double)
    case hsb(Double, Double, Double, Double)
}

class WifiLamp: ColorSwitchable {
    let state: LightState
    var color: Color
    
    init() {
        self.state = .on
        self.color = .rgb(0,0,0,0)
    }
    
    func switchColor(_ color: Color) {
        self.color = color
    }
}

protocol Animal {
    var numberOfLegs: Int { get }
}

protocol Pet: Animal {
    var cuddlyName: String { get }
}

struct Dog: Pet {
    var numberOfLegs: Int
    var cuddlyName: String
}

// Error handling

enum ParserError: Error {
    case emptyDictionary
    case invalidKey
}

struct Parser {
    var data: [String : String?]?
    
    func parse() throws {
        guard let dict = data else {
            throw ParserError.emptyDictionary
        }
        
        if !dict.keys.contains("someKey") {
            throw ParserError.invalidKey
        }
    }
}

let data: [String : String?]? = ["someKey": nil]
let parser = Parser(data: data)

do {
    try parser.parse()
} catch ParserError.emptyDictionary {
    print("Empty dict")
} catch ParserError.invalidKey {
    print("Invalid key")
}
