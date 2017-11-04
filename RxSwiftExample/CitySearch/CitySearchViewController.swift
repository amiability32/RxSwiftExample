//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by sally on 2017. 10. 29..
//  Copyright © 2017년 sally. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CitySearchViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    
    let allCities = ["Seoul", "New York", "London", "Oslo", "Warsaw", "Berlin", "Praga"]
    var shownCities = [String]()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shownCities = allCities
        tableView.dataSource = self
        
        searchBar
            .rx.text
            .orEmpty
            .debounce(0.2, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] query in
                if query.isEmpty {
                    self.shownCities = self.allCities
                }
                else {
                    self.shownCities = self.allCities.filter { $0.hasPrefix(query) }
                }
                self.tableView.reloadData()
                }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityPrototypeCell", for: indexPath)
        cell.textLabel?.text = shownCities[indexPath.row]
        
        return cell
    }
}

