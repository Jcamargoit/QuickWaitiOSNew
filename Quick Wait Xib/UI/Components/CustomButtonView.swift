//
//  CustomButtonView.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 15/03/22.
//

import Foundation
import UIKit

class CustomButtonView: UIView {

    var leadingContraint: NSLayoutConstraint?

    var contentView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.6
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var iconImage: UIImageView = {
       var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var buttonTitle: UILabel = {
       var lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = UIColor(red: 0.15, green: 0.66, blue: 0.69, alpha: 1.00)
        lbl.font = UIFont.systemFont(ofSize: 10)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
    }

    func createSubviews() {
        setupContentView()
        setupIconImage()
        setupButtonTitle()
    }

    func setupContentView() {
        addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func setupIconImage() {
        contentView.addSubview(iconImage)
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            iconImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 9),
            iconImage.widthAnchor.constraint(equalToConstant: 25)
        ])
    }

    func setupButtonTitle() {
        contentView.addSubview(buttonTitle)

        leadingContraint = buttonTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0)

        NSLayoutConstraint.activate([
            buttonTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            buttonTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            leadingContraint!,
            buttonTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func setImage(imageName: String) {
        self.iconImage.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        updateConstraintButton(padding: 25)
    }

    func setButtonTitle(text: String) {
        self.buttonTitle.text = text
    }

    func setupBoldFont(value: UIFont.Weight) {
        self.buttonTitle.font = UIFont.systemFont(ofSize: 11, weight: value)
    }

    func updateConstraintButton(padding: CGFloat) {
        self.leadingContraint!.constant = padding
        layoutIfNeeded()
    }
}
