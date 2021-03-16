//
//  RowValueCell.swift
//  AcademicPlan
//
//  Created by Asanali Zhansay on 16.03.2021.
//

import UIKit

class RowValueCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    var lesson: Lesson? {
        didSet {
            guard let lesson = lesson else {
                valueLabel.attributedText = nil
                return
            }
            
            let realHours = lesson.realHours ?? ""
            let hours = lesson.hours ?? ""
            
            let attrs1 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15),
                          NSAttributedString.Key.foregroundColor : UIColor.green]
            let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15),
                          NSAttributedString.Key.foregroundColor : (realHours == hours) ? UIColor.green : UIColor.red]
            let attrs3 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15),
                          NSAttributedString.Key.foregroundColor : UIColor.gray]

            let value = NSMutableAttributedString()
            let attributedString1 = NSAttributedString(string: realHours, attributes: attrs1)
            let attributedString2 = NSAttributedString(string: hours, attributes: attrs2)
            let attributedString3 = NSAttributedString(string: " / ", attributes: attrs3)

            value.append(attributedString1)
            value.append(attributedString3)
            value.append(attributedString2)
            
            valueLabel.attributedText = value
        }
    }
    
    private var valueLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .green
        label.textAlignment = .center
        
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

extension RowValueCell {
    
    private func setupViews() {
        backgroundColor = .white
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.gray.cgColor
        
        addSubview(valueLabel)
    }
    
    private func makeConstraints() {
        valueLabel.snp.makeConstraints { (m) in
            m.left.equalTo(15)
            m.right.equalTo(-15)
            m.centerY.equalToSuperview()
        }
    }
}

