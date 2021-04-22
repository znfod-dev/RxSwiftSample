//
//  Model.swift
//  RxSwiftSample
//
//  Created by ParkJonghyun on 2021/04/20.
//

import UIKit

//struct Model: Equatable, Hashable {
//    let name:String
//    let capital:String
//
//    static let ofAll: [Model] = {
//        let usa = Model(name: "USA", capital: "NewYork")
//        let korea = Model(name: "South Korea", capital: "Seoul")
//        let china = Model(name: "China", capital: "Shanghai")
//        let england = Model(name: "England", capital: "London")
//        let german = Model(name: "German", capital: "Berlin")
//        return [ usa, korea, china, england, german ]
//    }()
//
//
//}

class Model: NSObject {
    var name = String()
    var capital = String()
    var count = 0
    
    override init() {
        super.init()
    }
    init(name:String, capital:String) {
        self.name = name
        self.capital = capital
        self.count = 0
    }
    
    static let ofAll: [Model] = {
        let usa = Model(name: "USA", capital: "NewYork")
        let korea = Model(name: "South Korea", capital: "Seoul")
        let china = Model(name: "China", capital: "Shanghai")
        let england = Model(name: "England", capital: "London")
        let german = Model(name: "German", capital: "Berlin")
        return [ usa, korea, china, england, german ]
    }()
}
