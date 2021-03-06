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
    
    func setModel(subject:BehaviorRelay<Model>) {
        viewModel.subject = subject
    }
    
}

// MARK: - View LifeCycle
extension EditViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
    }
    
}

// MARK: - Setup
extension EditViewController {
    func setupUI() {
        viewModel.subject?.asObservable()
            .subscribe(onNext: { [weak self] value in
                self?.nameTextField.text = value.name
                self?.capitalTextField.text = value.capital
            })
            .disposed(by: viewModel.disposeBag)
        
        nameTextField.rx.text.subscribe(onNext: { [weak self] value in
            if let val = value {
                self?.viewModel.subject.value.name = val
            }
        })
        .disposed(by: viewModel.disposeBag)
        
        capitalTextField.rx.text.subscribe(onNext: { [weak self] value in
            if let val = value {
                self?.viewModel.subject.value.capital = val
            }
        })
        .disposed(by: viewModel.disposeBag)
        
        saveBtn.rx.tap.asObservable()
            .subscribe(onNext: {
                if let _ = ModelManager.shared.allModels.value.first(where: { $0 == self.viewModel.subject.value }) {
                    self.viewModel.subject.accept(self.viewModel.subject.value)
                }
                ModelManager.shared.allModels.accept(ModelManager.shared.allModels.value)
                self.navigationController?.popViewController(animated: true)
            })
            .disposed(by: viewModel.disposeBag)
    }
}

