//
//  DeveloperView.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 06/04/22.
//

import UIKit

class DeveloperView: UIView {
    var scrollView: UIScrollView = {
        var scrl = UIScrollView()
        scrl.showsVerticalScrollIndicator = false
        scrl.translatesAutoresizingMaskIntoConstraints = false
        return scrl
    }()

    var stackSigin: UIStackView = {
            var stk = UIStackView()
            stk.axis = .vertical
            stk.translatesAutoresizingMaskIntoConstraints = false
            return stk
        }()

    var contentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var viewBackGround: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.7
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.8
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        view.backgroundColor = UIColor(red: 0.30, green: 0.09, blue: 0.37, alpha: 1.00)
        return view
    }()

    var blurVisualEffectView: UIVisualEffectView = {
      var blur = UIVisualEffectView()
        let blurEffect = UIBlurEffect(style: .dark)
        blur = UIVisualEffectView(effect: blurEffect)
        blur.alpha = 0.6
        blur.translatesAutoresizingMaskIntoConstraints = false
       return blur
    }()

    var imgPersonBackGround: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "defaultIconPerson")
        img.clipsToBounds = true
        img.layer.masksToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var backButton: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "iconBackRegister")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var personImage: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "defaultIconPerson")
        img.layer.cornerRadius = 55
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var namePerson: UILabel = {
        var lbl = UILabel()
        lbl.text = "Carregando..."
        lbl.font = UIFont.boldSystemFont(ofSize: 40)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var personsArea: UILabel = {
        var lbl = UILabel()
        lbl.text = "Carregando..."
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var descriptionPerson: UILabel = {
        var lbl = UILabel()
        lbl.text = "Carregando..."
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 9
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var emailIcon: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "emailIcon")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var emailLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "carregando..."
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    var developersCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        var size = CGSize(width: 95, height: 95)
        layout.scrollDirection = .vertical
        layout.itemSize = size
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.register(DevelopersCollectionViewCell.self, forCellWithReuseIdentifier: DevelopersCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    var frameworkIcon: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "frameworkLogo")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var frameworkLabel: UILabel = {
        var lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 10)
        lbl.text = "Framework Digital 2022 - todos os direitos reservados"
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

        backgroundColor = .white

        setupScroll()
        setupStack()
        setupContentView()
        setupBackgroundImage()
        setupImgPerson()
        setupPersonDescription()
        setupEmailCamp()
        setupPersonsCollection()
        setupFrameworkLogo()
        setupBackButton()
    }
    
    func setupScroll() {

        addSubview(scrollView)
               NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
                scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
               ])
    }

    func setupStack() {
        scrollView.addSubview(stackSigin)
        NSLayoutConstraint.activate([
            stackSigin.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackSigin.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackSigin.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackSigin.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackSigin.widthAnchor.constraint(equalToConstant: size.width)
        ])
    }

    func setupContentView() {
        stackSigin.addArrangedSubview(contentView)
    }

    func setupBackgroundImage() {

        contentView.addSubview(imgPersonBackGround)
        NSLayoutConstraint.activate([
            imgPersonBackGround.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -50),
            imgPersonBackGround.leadingAnchor.constraint(equalTo: leadingAnchor),
            imgPersonBackGround.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        contentView.addSubview(blurVisualEffectView)
        NSLayoutConstraint.activate([
            blurVisualEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurVisualEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurVisualEffectView.heightAnchor.constraint(equalToConstant: size.height * 2)
        ])
        contentView.addSubview(viewBackGround)
        NSLayoutConstraint.activate([
            viewBackGround.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewBackGround.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewBackGround.heightAnchor.constraint(equalToConstant: size.height * 2)
        ])

    }

    func setupImgPerson() {
        contentView.addSubview(personImage)
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: size.height * 0.08),
            personImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            personImage.widthAnchor.constraint(equalToConstant: 110),
            personImage.heightAnchor.constraint(equalToConstant: 110)
        ])
    }

    func setupPersonDescription() {
        contentView.addSubview(namePerson)
        NSLayoutConstraint.activate([
            namePerson.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 15),
            namePerson.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            namePerson.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            namePerson.heightAnchor.constraint(equalToConstant: 50)
        ])

        contentView.addSubview(personsArea)
        NSLayoutConstraint.activate([
            personsArea.topAnchor.constraint(equalTo: namePerson.bottomAnchor, constant: 10),
            personsArea.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            personsArea.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            personsArea.heightAnchor.constraint(equalToConstant: 25)
        ])

        contentView.addSubview(descriptionPerson)
        NSLayoutConstraint.activate([
            descriptionPerson.topAnchor.constraint(equalTo: personsArea.bottomAnchor, constant: 30),
            descriptionPerson.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            descriptionPerson.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            descriptionPerson.heightAnchor.constraint(equalToConstant: 170)
        ])
    }

    func setupEmailCamp() {
        contentView.addSubview(emailLabel)
        NSLayoutConstraint.activate([
            emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailLabel.topAnchor.constraint(equalTo: descriptionPerson.bottomAnchor, constant: 30)
        ])

        contentView.addSubview(emailIcon)
        NSLayoutConstraint.activate([
            emailIcon.topAnchor.constraint(equalTo: emailLabel.topAnchor),
            emailIcon.trailingAnchor.constraint(equalTo: emailLabel.leadingAnchor, constant: -15),
            emailIcon.widthAnchor.constraint(equalToConstant: 25),
            emailIcon.heightAnchor.constraint(equalToConstant: 25),
            emailIcon.bottomAnchor.constraint(equalTo: imgPersonBackGround.bottomAnchor, constant: -50),
            emailIcon.bottomAnchor.constraint(equalTo: blurVisualEffectView.bottomAnchor, constant: -50),
            emailIcon.bottomAnchor.constraint(equalTo: viewBackGround.bottomAnchor, constant: -50)
        ])
    }

    func setupPersonsCollection() {
        contentView.addSubview(developersCollection)
        NSLayoutConstraint.activate([
            developersCollection.topAnchor.constraint(equalTo: imgPersonBackGround.bottomAnchor, constant: 30),
            developersCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            developersCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            developersCollection.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    func setupFrameworkLogo() {
        contentView.addSubview(frameworkIcon)
        NSLayoutConstraint.activate([
            frameworkIcon.topAnchor.constraint(equalTo: developersCollection.bottomAnchor, constant: size.height * 0.08),
            frameworkIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            frameworkIcon.trailingAnchor.constraint(equalTo: trailingAnchor),
            frameworkIcon.heightAnchor.constraint(equalToConstant: 40)
        ])

        contentView.addSubview(frameworkLabel)
        NSLayoutConstraint.activate([
            frameworkLabel.topAnchor.constraint(equalTo: frameworkIcon.bottomAnchor, constant: 3),
            frameworkLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            frameworkLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
    }

    func setupBackButton() {
        addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 50),
            backButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func updateTexts(person: DeveloperModelElement) {
        namePerson.text = person.name
        personsArea.text = person.ocupation
        descriptionPerson.text = person.description
        emailLabel.text = person.email

        personImage.downloaded(from: person.imageURL, contentMode: .scaleAspectFill)
        imgPersonBackGround.downloaded(from: person.imageURL, contentMode: .scaleAspectFill)
    }
}
