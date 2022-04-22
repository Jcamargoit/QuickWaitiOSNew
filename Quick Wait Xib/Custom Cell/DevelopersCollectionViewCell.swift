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
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var imagemItem: UIImageView = {
        var img = UIImageView()
        img.tintColor = .white
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

        viewItem.addSubview(imagemItem)
        NSLayoutConstraint.activate([
            imagemItem.centerYAnchor.constraint(equalTo: viewItem.centerYAnchor, constant: -10),
            imagemItem.centerXAnchor.constraint(equalTo: viewItem.centerXAnchor),
            imagemItem.heightAnchor.constraint(equalToConstant: 75),
            imagemItem.widthAnchor.constraint(equalToConstant: 75)
        ])
    }

    func configCell(_ item: DeveloperModelElement) {
        let image = UIImage(named: .logo)?.withRenderingMode(.alwaysTemplate)
        imagemItem.image = image
    }
}
