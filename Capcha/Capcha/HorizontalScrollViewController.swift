//
//  HorizontalScrollViewController.swift
//  Capcha
//
//  Created by 蔡越 on 16/12/17.
//  Copyright © 2016年 Nanjing University. All rights reserved.
//

import UIKit
import SnapKit

class HorizontalScrollViewController: UIViewController {
    
    var photographerViewController = PhotographerViewController()
    var modelViewController = ModelViewController()
    
    lazy var horizontalScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.contentSize = CGSize(width: self.view.bounds.size.width * 2, height: self.view.bounds.size.height)
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        setupSubviews()
        setupNavBar()
    }
    
    func setupSubviews() {
        view.addSubview(self.horizontalScrollView)
        
        horizontalScrollView.addSubview(photographerViewController.view)
        photographerViewController.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        
        horizontalScrollView.addSubview(modelViewController.view)
        modelViewController.view.frame = CGRect(x: self.view.bounds.size.width, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    func setupNavBar() {
        let photographersButtonItem = UIBarButtonItem(title: "摄影圈", style: .plain, target: self, action: nil)
        let modelsButtonItem = UIBarButtonItem(title: "模特圈", style: .plain, target: self
            , action: #selector(moveToModel))
        modelsButtonItem.tintColor = .gray
        self.navigationItem.leftBarButtonItems = [photographersButtonItem, modelsButtonItem]
    }
    
    func moveToModel() {
        
    }
    
    func barButtons() -> [UIBarButtonItem]? {
        return self.navigationItem.leftBarButtonItems
    }
}

extension HorizontalScrollViewController: UIScrollViewDelegate {
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / self.view.frame.size.width
        let buttonItems = barButtons()
        if page == 0 {
            
        }else {
            buttonItems?[1].tintColor = .green
            self.modelViewController.refresh()
        }
    }
}
