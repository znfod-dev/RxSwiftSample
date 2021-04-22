//
//  EditViewController.swift
//  RxSwiftSample
//
//  Created by ParkJonghyun on 2021/04/21.
//

import UIKit
import RxSwift
import RxCocoa

class EditViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var capitalTextField: UITextField!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    var viewModel = EditViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
    }
    
}

// MARK: - Setup
extension EditViewController {
    func setupUI() {
        nameTextField.rx.text.subscribe(onNext: { [unowned self] value in
            if let val = value {
                viewModel.subject.value.name = val
            }
        })
        .disposed(by: viewModel.disposeBag)
        
        capitalTextField.rx.text.subscribe(onNext: { [unowned self] value in
            if let val = value {
                viewModel.subject.value.capital = val
                viewModel.subject.accept(viewModel.subject.value)
            }
        })
        .disposed(by: viewModel.disposeBag)
        
        saveBtn.rx.tap.asObservable()
            .subscribe(onNext: {
                self.viewModel.subject.accept(self.viewModel.subject.value)
            })
            .disposed(by: viewModel.disposeBag)
    }
}

