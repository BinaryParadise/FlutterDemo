//
//  NavBarView.swift
//  Runner
//
//  Created by Rake Yang on 2022/1/17.
//

import UIKit
import SwifterSwift

class NavBarView: UIView {
    private let titleLabel = UILabel()
    let contentView = UIView()
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.left.bottom.right.equalToSuperview()
        }
        
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = UIColor(hex: 0x333333)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
