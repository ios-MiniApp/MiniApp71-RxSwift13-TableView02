//
//  ViewModel.swift
//  MiniApp71-RxSwift13-TableView02
//
//  Created by 前田航汰 on 2022/08/01.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {

    var dataObservable = PublishSubject<[String]>()
    var data: [String] = []
    private let disposeBag = DisposeBag()

    init(addButton: Observable<Void>,
         deleteButton: Observable<Void>) {

        addButton.asObservable()
            .subscribe(onNext: { [weak self] in
                self?.data.append(contentsOf: ["tableView増強！"])
                self?.dataObservable.onNext(self?.data ?? [])
            })
            .disposed(by: disposeBag)

        deleteButton.asObservable()
            .subscribe(onNext: { [weak self] in
                self?.data = []
                self?.dataObservable.onNext(self?.data ?? [])
            })
            .disposed(by: disposeBag)

    }
}
