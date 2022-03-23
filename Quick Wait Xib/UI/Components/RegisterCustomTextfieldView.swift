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
        return lbl
    }()
    
    var requiredLabel: UILabel = {
       var lbl = UILabel()
        lbl.text = "*"
        lbl.font = UIFont.systemFont(ofSize: 3)
        lbl.textColor = .systemPink
        return lbl
    }()
    
    var textfield: UITextView = {
       var txt = UITextView()
        txt.font = UIFont.systemFont(ofSize: 26)
        txt.backgroundColor = .white
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
    }
    
    func bindText() {
        self.textfield.rx.text.bind { value in self.text.accept(value ?? "") }.disposed(by: disposable)
    }
    
    func setupContentView() {
        addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
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
            textfield.topAnchor.constraint(equalTo: fieldTitle.bottomAnchor, constant: 10),
            textfield.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textfield.trailingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textfield.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setTitle(value: String) {
        self.fieldTitle.text = value
    }
    
    func makeTextRequired() {
        addSubview(requiredLabel)
        NSLayoutConstraint.activate([
            requiredLabel.topAnchor.constraint(equalTo: fieldTitle.topAnchor),
            requiredLabel.leadingAnchor.constraint(equalTo: fieldTitle.trailingAnchor, constant: 2)
        ])
    }
    
    
}
