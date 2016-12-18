//
//  PhotographerViewController.swift
//  Capcha
//
//  Created by 蔡越 on 16/12/17.
//  Copyright © 2016年 Nanjing University. All rights reserved.
//

import UIKit

class PhotographerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupNavBar()
        
    }
    
    func setupNavBar() {
        let photographersButtonItem = UIBarButtonItem(title: "摄影圈", style: .plain, target: self, action: nil)
        let modelsButtonItem = UIBarButtonItem(title: "模特圈", style: .plain, target: self
            , action: nil)
        modelsButtonItem.tintColor = .gray
        self.navigationItem.leftBarButtonItems = [photographersButtonItem, modelsButtonItem]
    }
    
}
