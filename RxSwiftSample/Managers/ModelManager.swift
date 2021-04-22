//
//  ModelManager.swift
//  RxSwiftSample
//
//  Created by ParkJonghyun on 2021/04/20.
//

import UIKit
import RxSwift
import RxCocoa

class ModelManager: NSObject {
    
    static let shared = ModelManager()
    
    let allModels: BehaviorRelay<[Model]> = BehaviorRelay(value: Model.ofAll)
    
    override init() {
        super.init()
    }
    
    
}
