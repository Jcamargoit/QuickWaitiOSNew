//
//  DeveloperView.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 06/04/22.
//

import UIKit

class DeveloperView: UIView {

    var imgPersonBackGround: UIImageView = {
        var img = UIImageView()

        return img
    }()

    var backButton: UIButton = {
       var btn = UIButton()

        return btn
    }()

    var personImage: UIImageView = {
       var img = UIImageView()

        return img
    }()

    var namePerson: UILabel = {
       var lbl = UILabel()

        return lbl
    }()

    var personsArea: UILabel = {
       var lbl = UILabel()

        return lbl
    }()

    var descriptionPerson: UILabel = {
        var lbl = UILabel()

        return lbl
    }()

    var emailIcon: UIImageView = {
       var img = UIImageView()

        return img
    }()

    var emailLabel: UILabel = {
       var lbl = UILabel()

        return lbl
    }()

    var developersCollection: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.translatesAutoresizingMaskIntoConstraints = false
            collection.backgroundColor = .clear
            collection.showsVerticalScrollIndicator = false
            collection.register(DevelopersCollectionViewCell.self, forCellWithReuseIdentifier: DevelopersCollectionViewCell.identifier)
            return collection
    }()

    var frameworkIcon: UIImageView = {
        var img = UIImageView()

        return img
    }()

    var frameworkLabel: UILabel = {
      var lbl = UILabel()

        return lbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func createSubviews() {

    }

    func setupBackgroundImage() {
        addSubview(imgPersonBackGround)
        NSLayoutConstraint.activate([
            imgPersonBackGround.topAnchor.constraint(equalTo: topAnchor),
            imgPersonBackGround.leadingAnchor.constraint(equalTo: leadingAnchor),
            imgPersonBackGround.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func setupImgPerson() {
        addSubview(personImage)
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            personImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            personImage.widthAnchor.constraint(equalToConstant: 100),
            personImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    func setupPersonDescription() {
        addSubview(namePerson)
        NSLayoutConstraint.activate([
            namePerson.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 5),
            namePerson.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            namePerson.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])

        addSubview(personsArea)
        NSLayoutConstraint.activate([
            personsArea.topAnchor.constraint(equalTo: namePerson.bottomAnchor, constant: 10),
            personsArea.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            personsArea.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])

        addSubview(descriptionPerson)
        NSLayoutConstraint.activate([
            descriptionPerson.topAnchor.constraint(equalTo: namePerson.bottomAnchor, constant: 10),
            descriptionPerson.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            descriptionPerson.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)
        ])
    }

    func setupEmailCamp() {
        addSubview(emailLabel)
        NSLayoutConstraint.activate([
            emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailLabel.topAnchor.constraint(equalTo: descriptionPerson.bottomAnchor, constant: 30),
            emailLabel.bottomAnchor.constraint(equalTo: imgPersonBackGround.bottomAnchor, constant: -30)
        ])

        addSubview(emailIcon)
        NSLayoutConstraint.activate([
            emailIcon.centerYAnchor.constraint(equalTo: emailLabel.centerYAnchor),
            emailIcon.trailingAnchor.constraint(equalTo: emailLabel.leadingAnchor, constant: -15),
            emailIcon.widthAnchor.constraint(equalToConstant: 25),
            emailIcon.heightAnchor.constraint(equalToConstant: 25)
        ])
    }

    func setupPersonsCollection() {
        addSubview(developersCollection)
        NSLayoutConstraint.activate([
            developersCollection.topAnchor.constraint(equalTo: imgPersonBackGround.bottomAnchor, constant: 15),
            developersCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            developersCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            developersCollection.heightAnchor.constraint(equalToConstant: size.height * 0.2)
        ])
    }

    func setupFrameworkLogo() {
        addSubview(frameworkIcon)
        NSLayoutConstraint.activate([
            frameworkIcon.topAnchor.constraint(equalTo: developersCollection.bottomAnchor, constant: 20),
            frameworkIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            frameworkIcon.trailingAnchor.constraint(equalTo: trailingAnchor),
            frameworkIcon.heightAnchor.constraint(equalToConstant: 60)
        ])

        addSubview(frameworkLabel)
        NSLayoutConstraint.activate([
            frameworkLabel.topAnchor.constraint(equalTo: frameworkIcon.bottomAnchor, constant: 4),
            frameworkLabel.centerXAnchor.constraint(equalTo: centerXAnchor)

        ])
    }

}
