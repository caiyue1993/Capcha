//
//  HorizontalScrollViewController.swift
//  Capcha
//
//  Created by 蔡越 on 16/12/17.
//  Copyright © 2016年 Nanjing University. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

class HorizontalScrollViewController: UIViewController {
    
    var photographerViewController = PhotographerViewController()
    var modelViewController = ModelViewController()
    
    lazy var photographersButtonItem: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setTitle("摄影圈", for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(moveToPhotographer), for: .touchUpInside)
        let buttonItem = UIBarButtonItem(customView: button)
        return buttonItem
    }()
    
    lazy var modelsButtonItem: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setTitle("模特圈", for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(moveToModel), for: .touchUpInside)
        let buttonItem = UIBarButtonItem(customView: button)
        return buttonItem
    }()
    
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
        view.addSubview(horizontalScrollView)
        
        horizontalScrollView.addSubview(photographerViewController.view)
        photographerViewController.view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        horizontalScrollView.addSubview(modelViewController.view)
        modelViewController.view.frame = CGRect(x: view.bounds.size.width, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
    }
    
    func setupNavBar() {
        
        if let button = photographersButtonItem.customView as? UIButton {
            button.setTitleColor(UIColor(hex: 0x424242, transparency: 1.0), for: .normal)
        }
        
        if let button = modelsButtonItem.customView as? UIButton {
            button.setTitleColor(UIColor(hex: 0x424242, transparency: 0.3), for: .normal)
        }
    
        navigationItem.leftBarButtonItems = [photographersButtonItem, modelsButtonItem]
    }
    
    func moveToModel() {
        horizontalScrollView.setContentOffset(CGPoint(x: view.frame.size.width, y: 0), animated: true)
    }
    
    func moveToPhotographer() {
        horizontalScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    func barButtons() -> [UIBarButtonItem]? {
        return navigationItem.leftBarButtonItems
    }
    
}

extension HorizontalScrollViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let alphaOfModelButtonItem = (scrollView.contentOffset.x / view.frame.size.width)
        if let button = photographersButtonItem.customView as? UIButton {
            button.setTitleColor(UIColor(hex: 0x424242, transparency: 1 - alphaOfModelButtonItem * 0.7), for: .normal)
        }
        
        if let button = modelsButtonItem.customView as? UIButton {
            button.setTitleColor(UIColor(hex: 0x424242, transparency: alphaOfModelButtonItem + 0.3), for: .normal)
        }
    }
    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let page = scrollView.contentOffset.x / view.frame.size.width
//        
//    }
}
