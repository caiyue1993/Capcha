//
//  PhotographerViewController.swift
//  Capcha
//
//  Created by 蔡越 on 16/12/17.
//  Copyright © 2016年 Nanjing University. All rights reserved.
//

import UIKit
import SnapKit
import LeanCloud

class PhotographerViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CapchaHomeTableViewCell.self, forCellReuseIdentifier: "cellReuseIdentifier")
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var refreshControl: RainyRefreshControl = {
        let refreshControl = RainyRefreshControl()
        refreshControl.addTarget(self, action: #selector(requirePhotographerInfo), for: .valueChanged)
        return refreshControl
    }()
    
    var photographers: [Photographer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    func refresh() {
        let popTime = DispatchTime.now() + Double(Int64(3.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC);
        DispatchQueue.main.asyncAfter(deadline: popTime) { () -> Void in
            self.refreshControl.endRefreshing()
        }
    }
    
    func requirePhotographerInfo() {
        let query = LCQuery(className: "Photographer")
        query.find { result in
            switch result {
            case .success(let photographers):
                if let `photographers` = photographers as? [Photographer] {
                    self.photographers = `photographers`
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing() // Dalay for 1 seconds just for delight of rainy animation
                })
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension PhotographerViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photographers.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath) as! CapchaHomeTableViewCell
        cell.selectionStyle = .none
        cell.nameLabel.text = "我叫 " + (photographers[indexPath.row].name?.value)!
        cell.locationLabel.text = photographers[indexPath.row].city?.value
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
