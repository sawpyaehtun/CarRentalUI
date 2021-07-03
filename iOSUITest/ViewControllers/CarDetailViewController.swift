//
//  CarDetailViewController.swift
//  iOSUITest
//
//  Created by Tamron iMac 001 on 7/3/21.
//

import UIKit

class CarDetailViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupUI() {
        super.setupUI()
        setupTableView()
        tableView.reloadData()
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.registerForCells(cells: CarDetailInfoTableViewCell.self)
        tableView.bounces = false
    }

    @IBAction func didTapBtnCopy(_ sender: Any) {
        showToast(message: "Copied Booking ID : 44123331")
    }
    
    @IBAction func didTapBtnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

//MARK:- tableView Delegate and DataSource
extension CarDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return carDetailInfoCell(indexPath: indexPath)
    }
}

//MARK:- cells for tableView
extension CarDetailViewController {
    private func carDetailInfoCell(indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReuseCell(type: CarDetailInfoTableViewCell.self, indexPath: indexPath)
        return cell
    }
}
