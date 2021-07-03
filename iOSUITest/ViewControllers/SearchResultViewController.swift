//
//  SearchResultViewController.swift
//  iOSUITest
//
//  Created by Tamron iMac 001 on 7/3/21.
//

import UIKit

class SearchResultViewController: BaseViewController {

    @IBOutlet weak var brnBack: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupUI() {
        super.setupUI()
        setupTableView()
        tableView.reloadData()
    }


    @IBAction func didTapBtnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.registerForCells(cells: CarItemTableViewCell.self)
    }
    
}


//MARK:- tableView Delegate and Datasource
extension SearchResultViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return carItemCell(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CarDetailViewController.init()
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:- cells for TableView
extension SearchResultViewController {
    private func carItemCell(indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReuseCell(type: CarItemTableViewCell.self, indexPath: indexPath)
        return cell
    }
}
