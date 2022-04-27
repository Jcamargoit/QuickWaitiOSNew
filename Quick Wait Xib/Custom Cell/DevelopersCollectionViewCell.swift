//
//  DevelopersCollectionViewCell.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 06/04/22.
//

import Foundation
import UIKit

class DevelopersCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DevelopersCollectionViewCell"
    
    var viewItem: UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var border: UIView = {
       var view = UIView()
        view.backgroundColor = UIColor(red: 0.40, green: 0.19, blue: 0.47, alpha: 1.00)
        view.layer.cornerRadius = 40.5
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var imagemItem: UIImageView = {
        var img = UIImageView()
        img.tintColor = .white
        img.image = UIImage(named: "defaultIconPerson")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews() {
        setupViewItens()
    }
    
    func setupViewItens() {
        
        contentView.addSubview(viewItem)
        NSLayoutConstraint.activate([
            viewItem.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewItem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        viewItem.addSubview(border)
        NSLayoutConstraint.activate([
            border.topAnchor.constraint(equalTo: viewItem.topAnchor,constant: 6),
            border.leadingAnchor.constraint(equalTo: viewItem.leadingAnchor,constant: 6),
            border.trailingAnchor.constraint(equalTo: viewItem.trailingAnchor,constant: -6),
            border.bottomAnchor.constraint(equalTo: viewItem.bottomAnchor,constant: -6)
        ])
        
        viewItem.addSubview(imagemItem)
        NSLayoutConstraint.activate([
            imagemItem.topAnchor.constraint(equalTo: viewItem.topAnchor, constant: 10),
            imagemItem.bottomAnchor.constraint(equalTo: viewItem.bottomAnchor, constant: -10),
            imagemItem.leadingAnchor.constraint(equalTo: viewItem.leadingAnchor, constant: 10),
            imagemItem.trailingAnchor.constraint(equalTo: viewItem.trailingAnchor, constant: -10)
            ])
    }

    func configCell(_ item: DeveloperModelElement) {
        self.imagemItem.downloaded(from: item.imageURL, contentMode: .scaleAspectFill)
        self.imagemItem.layer.cornerRadius = 37.5
        self.imagemItem.clipsToBounds = true
    }
}
