//
//  CategoryCollectionViewCell.swift
//  E-Commerce App
//
//  Created by Jeeva K on 02/05/26.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            styleCell(isSelected: false)
        }
        
        func styleCell(isSelected: Bool) {
            contentView.layer.cornerRadius = 18
            contentView.layer.borderWidth = 1
            
            if isSelected {
                contentView.backgroundColor = .black
                titleLabel.textColor = .white
                contentView.layer.borderColor = UIColor.black.cgColor
            } else {
                contentView.backgroundColor = .clear
                titleLabel.textColor = .black
                contentView.layer.borderColor = UIColor.lightGray.cgColor
            }
        }
}
