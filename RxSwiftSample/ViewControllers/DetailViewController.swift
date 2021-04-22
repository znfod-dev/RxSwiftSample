//
//  DetailViewController.swift
//  RxSwiftSample
//
//  Created by ParkJonghyun on 2021/04/21.
//

import UIKit
import RxSwift
import RxCocoa

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countStepper: UIStepper!
    @IBOutlet weak var editBtn: UIBarButtonItem!
    
    var viewModel = DetailViewModel()
    
    func setModel(model:Model) {
        viewModel.subject = BehaviorRelay(value: model)
    }
    
}
// MARK: - View LifeCycle
extension DetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailViewController viewDidLoad")
        self.setupUI()
        
    }
    
}
// MARK: - Setup
extension DetailViewController {
    
    func setupUI() {
        viewModel.subject?.asObservable()
            .subscribe(onNext: { [weak self] value in
                self?.nameLabel.text = value.name
                self?.capitalLabel.text = value.capital
                self?.countLabel.text = String(value.count)
                self?.countStepper.value = Double(value.count)
            })
            .disposed(by: viewModel.disposeBag)
        
        
        editBtn.rx.tap.asObservable()
            .subscribe(onNext: {
                let vc = self.storyboard?.instantiateViewController(identifier: "EditViewController") as! EditViewController
                vc.setModel(subject: self.viewModel.subject)
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: viewModel.disposeBag)
        
        self.setupStepper()
    }
    
    func setupStepper() {
        self.countStepper.wraps = true
        self.countStepper.autorepeat = true
        self.countStepper.maximumValue = 100
        self.countStepper.minimumValue = 0
        
        self.countStepper.rx.value.subscribe(onNext: { [unowned self] value in
            if let md = ModelManager.shared.allModels.value.first(where: { $0 == self.viewModel.subject.value }) {
                md.count = Int(value)
                self.viewModel.subject.accept(md)
            }
            ModelManager.shared.allModels.accept(ModelManager.shared.allModels.value)
        })
        .disposed(by: viewModel.disposeBag)
    }
    
}
