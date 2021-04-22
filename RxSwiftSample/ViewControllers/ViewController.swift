//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by ParkJonghyun on 2021/04/20.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBtn: UIButton!
    
    let viewModel = ViewModel()
    
    
}
// MARK: - View LifeCycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController viewDidLoad")
        self.setupUI()
        
    }
    
}

// MARK: - Setup
extension ViewController {
    func setupUI() {
        print("ViewController setupUI")
        self.setupTableView()
        self.setupCellTapHandling()
        self.setupButtons()
    }
    
    func setupTableView() {
        print("ViewController setupTableView")
        self.viewModel.list
            .bind(to: tableView.rx.items(cellIdentifier: "Cell",
                                         cellType: TableCell.self)) { row, model, cell in
                print("ViewController 바뀜")
                cell.setData(model: model)
            }
            .disposed(by: viewModel.disposeBag)
    }
    func setupCellTapHandling() {
        tableView.rx.modelSelected(Model.self)
            .subscribe (onNext: { [unowned self] model in
                print("ViewController modelSelected")
                if let selectedIndexPath = self.tableView.indexPathForSelectedRow {
                    self.tableView.deselectRow(at: selectedIndexPath, animated: true)
                }
                let vc = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
                vc.setModel(model: model)
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: viewModel.disposeBag)
    }
    
    func setupButtons() {
        addBtn.rx.tap.asObservable()
            .subscribe(onNext: {
                print("ViewController addBtn Clicked")
                let vc = self.storyboard?.instantiateViewController(identifier: "AddViewController") as! AddViewController
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: viewModel.disposeBag)
    }
    
}






