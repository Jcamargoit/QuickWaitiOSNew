//
//  RegisterCustomTextfieldView.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 15/03/22.
//

import Foundation
import UIKit
import RxSwift
import RxRelay

class RegisterCustomTextfieldView: UIView {
    var text: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var disposable: DisposeBag = DisposeBag()
    
    var contentView: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var fieldTitle: UILabel = {
       var lbl = UILabel()
        lbl.textColor = UIColor(red: 0.00, green: 0.64, blue: 0.66, alpha: 1.00)
        lbl.font = UIFont.init(name: "QuicksandBook-Regular", size: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var requiredLabel: UILabel = {
       var lbl = UILabel()
        lbl.text = "*"
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textColor = .systemPink
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var textfield: UITextField = {
       var txt = UITextField()
        txt.font = UIFont.systemFont(ofSize: 23)
        txt.backgroundColor = .white
        txt.keyboardType = .alphabet
        txt.autocapitalizationType = .none
        txt.layer.masksToBounds = false
        txt.layer.shadowOpacity = 0.6
        txt.layer.shadowColor = UIColor.gray.cgColor
        txt.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        txt.layer.cornerRadius = 12
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
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
        bindText()
        setupContentView()
        setupTitle()
        setupTextField()
    }
    
    func bindText() {
        self.textfield.rx.text.bind { value in self.text.accept(value ?? "") }.disposed(by: disposable)
    }
    
    func setupContentView() {
        addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupTitle() {
        contentView.addSubview(fieldTitle)
        NSLayoutConstraint.activate([
            fieldTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            fieldTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
    }
    
    func setupTextField() {
        contentView.addSubview(textfield)
        NSLayoutConstraint.activate([
            textfield.topAnchor.constraint(equalTo: fieldTitle.bottomAnchor, constant: 3),
            textfield.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textfield.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            textfield.heightAnchor.constraint(equalToConstant: 40),
            textfield.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    func setTitle(value: String) {
        self.fieldTitle.text = value
    }
    
    func setupNewTypeInput(input: UIKeyboardType) {
        self.textfield.keyboardType = input
    }
    
    func makeTextRequired() {
    contentView.addSubview(requiredLabel)
        NSLayoutConstraint.activate([
            requiredLabel.topAnchor.constraint(equalTo: fieldTitle.topAnchor,constant: -2),
            requiredLabel.leadingAnchor.constraint(equalTo: fieldTitle.trailingAnchor, constant: 2)
        ])
        layoutIfNeeded()
    }
    
    
}
