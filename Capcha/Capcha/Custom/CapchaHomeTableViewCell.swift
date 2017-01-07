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
        label.font = UIFont(name: "Kaiti SC", size: 18)
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Kaiti SC", size: 20)
        return label
    }()
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var upperLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.capchaLineColor()
        return line
    }()
    
    lazy var belowLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.capchaLineColor()
        return line
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
        contentView.addSubview(upperLine)
        contentView.addSubview(belowLine)
    }
    
    func setupConstraints() {
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(18)
            make.leading.equalTo(contentView).offset(16)
        }
        upperLine.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel)
            make.centerX.equalTo(contentView).multipliedBy(0.8)
            make.width.equalTo(1)
            make.height.equalTo(40)
        }
        locationLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.centerX.equalTo(contentView).multipliedBy(0.8)
        }
        belowLine.snp.makeConstraints { (make) in
            make.centerX.equalTo(upperLine)
            make.top.equalTo(locationLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(upperLine)
        }
        photoImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(locationLabel)
            make.centerX.equalTo(contentView).multipliedBy(1.4)
        }
    }
}
