//
//  RowTitleCell.swift
//  AcademicPlan
//
//  Created by Asanali Zhansay on 16.03.2021.
//

import UIKit

class RowTitleCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var titleColor: UIColor? {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 2
        
        return label
    }()
    
    // MARK: - Overridden: ParentClass
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        makeConstraints()
    }
}

// MARK: UI Configuration

extension RowTitleCell {
    
    private func setupViews() {
        backgroundColor = .lightGray
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.gray.cgColor
        
        addSubview(titleLabel)
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { (m) in
            m.left.equalTo(15)
            m.right.equalTo(-15)
            m.centerY.equalToSuperview()
        }
    }
}
