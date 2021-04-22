//
//  DetailViewModel.swift
//  RxSwiftSample
//
//  Created by ParkJonghyun on 2021/04/21.
//

import UIKit
import RxSwift
import RxCocoa

class DetailViewModel: NSObject {
    
    var subject:BehaviorRelay<Model>!
    
    let disposeBag = DisposeBag()
    
    override init() {
        super.init()
        
    }
    
}
