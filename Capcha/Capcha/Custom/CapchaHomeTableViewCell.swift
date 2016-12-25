//
//  CapchaHomeTableViewCell.swift
//  Capcha
//
//  Created by 蔡越 on 16/12/24.
//  Copyright © 2016年 Nanjing University. All rights reserved.
//

import UIKit

public class CapchaHomeTableViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "小青"
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "大白"
        return label
    }()
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    class func defaultHeight() -> CGFloat {
        return 160
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(photoImageView)
    }
    
    func setupConstraints() {
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(12)
            make.leading.equalTo(contentView).offset(8)
        }
        locationLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.centerX.equalTo(contentView).multipliedBy(0.8)
        }
        photoImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(locationLabel)
            make.centerX.equalTo(contentView).multipliedBy(1.4)
        }
    }
}
