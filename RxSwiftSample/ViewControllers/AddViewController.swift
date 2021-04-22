//
//  AddViewController.swift
//  RxSwiftSample
//
//  Created by ParkJonghyun on 2021/04/21.
//

import UIKit
import RxSwift
import RxCocoa

class AddViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var capitalTextField: UITextField!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    var viewModel = AddViewModel()
    
    
}

// MARK: - View LifeCycle
extension AddViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
}

// MARK: - Setup
extension AddViewController {
    func setupUI() {
        nameTextField.rx.text.subscribe(onNext: { [unowned self] value in
            if let val = value {
                viewModel.model.name = val
            }
        })
        .disposed(by: viewModel.disposeBag)
        
        capitalTextField.rx.text.subscribe(onNext: { [unowned self] value in
            if let val = value {
                viewModel.model.capital = val
            }
        })
        .disposed(by: viewModel.disposeBag)
        
        saveBtn.rx.tap.asObservable()
            .subscribe(onNext: {
                let newValue = ModelManager.shared.allModels.value + [self.viewModel.model]
                ModelManager.shared.allModels.accept(newValue)
                self.navigationController?.popViewController(animated: true)
            })
            .disposed(by: viewModel.disposeBag)
    }
}

