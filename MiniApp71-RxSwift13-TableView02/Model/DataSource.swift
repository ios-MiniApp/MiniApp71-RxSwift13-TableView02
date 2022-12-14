//
//  DataSource.swift
//  MiniApp71-RxSwift13-TableView02
//
//  Created by 前田航汰 on 2022/08/01.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class DataSource: NSObject, UITableViewDataSource, RxTableViewDataSourceType {

    typealias Element = [String]
    var item: [String] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        let element = item[indexPath.row]
        cell.textLabel?.text = element
        return cell
    }

    func tableView(_ tableView: UITableView, observedEvent: Event<[String]>) {
        Binder(self) { dataSource, element in
            dataSource.item = element
            tableView.reloadData()
        }
        .on(observedEvent)
    }

}
