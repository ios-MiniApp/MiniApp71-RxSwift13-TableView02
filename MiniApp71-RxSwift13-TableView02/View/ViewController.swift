//
//  ViewController.swift
//  MiniApp71-RxSwift13-TableView02
//
//  Created by 前田航汰 on 2022/08/01.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var deleteButton: UIButton!
    @IBOutlet private weak var rxTableView: UITableView!

    private var dataSource = DataSource()
    private let disposeBag = DisposeBag()
    private var viewModel: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        setupTableView()
    }

    private func setupBinding() {

        viewModel = ViewModel(
            addButton: addButton.rx.tap.asObservable(),
            deleteButton: deleteButton.rx.tap.asObservable()
        )

//        viewModel?.dataObservable
//            .bind(to: rxTableView.rx.items(cellIdentifier: "TableViewCell", cellType: TableViewCell.self)) { row, element, cell in
//                print(element)
//                cell.nameLabel.text = element
//            }
//            .disposed(by: disposeBag)

        viewModel?.dataObservable
            .bind(to: rxTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

    private func setupTableView() {
        rxTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }

}

