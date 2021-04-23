//
//  ViewModel.swift
//  RxSwiftSample
//
//  Created by ParkJonghyun on 2021/04/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewModel: NSObject {
    
    var list = ModelManager.shared.allModels
    
    let disposeBag = DisposeBag()
    
    override init() {
        super.init()
        
    }
}
