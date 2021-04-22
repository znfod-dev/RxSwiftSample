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
    
    let disposeBag = DisposeBag()
    var list = ModelManager.shared.allModels
    
    override init() {
        super.init()
        
    }
}
