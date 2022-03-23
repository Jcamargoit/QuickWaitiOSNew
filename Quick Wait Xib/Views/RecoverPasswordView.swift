//
//  RecoverPasswordView.swift
//  Quick Wait Xib
//
//  Created by Rafael Ortiz on 17/03/22.
//

import UIKit

class RecoverPasswordView: UIView {
    
    let screenSize = UIScreen.main.bounds
    
    let scrollView: UIScrollView = {
        var scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    let containerView: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let btnBack: UIButton = {
        var btn = UIButton(type: .system)
        btn.frame = CGRect(x: 20, y: 50, width: 38, height: 38)
        btn.setImage(UIImage(named: "iconBtnBack")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let stackView: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    let viewLogo: UIImageView = {
       var img = UIImageView()
        img.image = UIImage(named: "iconLook")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let title: UILabel = {
        var label = UILabel()
        label.text = "Esqueceu a sua senha?"
        label.text = label.text?.uppercased()
        label.textColor = K.Colors.mainTitle
        label.font = K.Fonts.mainTitle
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let featuredText: UILabel = {
        var label = UILabel()
        label.text = "Digite seu e-mail abaixo e lhe enviaremos um código de verificação."
        label.textColor = K.Colors.mainFeaturedText
        label.font = K.Fonts.mainFeaturedText
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailTextField: MainTextField = {
        var field = MainTextField()
        field.keyboardType = .emailAddress
        field.returnKeyType = .done
        return field
    }()
    
    let nextButton: UIButton = {
       var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Próximo", for: .normal)
        btn.setTitleColor(K.Colors.mainFormButton, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 12
        btn.layer.shadowOpacity = 0.6
        btn.layer.shadowColor = UIColor.gray.cgColor
        btn.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        return btn
    }()
    
    let banner: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowOpacity = 0.6
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize.init(width: 0, height: 3)
        return view
    }()
    
    let bannerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        return stackView
    }()
    
    let bannerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confira o código de verificação em sua caixa de entrada. Ele pode estar na pasta de lixo eletrônico."
        label.textColor = K.Colors.bannerText
        label.font = K.Fonts.bannerText
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    let rightSign: UIImageView = {
        let image = UIImageView(image: UIImage(named: "warninSign"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var safeArea: UILayoutGuide?
    weak var viewController: UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView(viewController: UIViewController) {
        
        backgroundColor = K.Colors.mainBackground
        self.viewController = viewController
        self.safeArea = viewController.view.safeAreaLayoutGuide
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: Hierarchy
    private func setupHierarchy() {

        addSubview(scrollView)
        addSubview(btnBack)
        
        scrollView.addSubview(containerView)
        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(viewLogo)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(featuredText)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(nextButton)
        stackView.addArrangedSubview(banner)
        
        banner.addSubview(bannerStackView)
        bannerStackView.addArrangedSubview(bannerLabel)
        bannerStackView.addArrangedSubview(rightSign)
    }
    
    // MARK: Layout
    private func setupLayout() {
        
        guard let safeArea = safeArea else {
            return
        }

        // MARK: scrollview to safe area
        scrollView.pinToSafeArea([.top, .left, .right, .bottom], constant: 0, safeArea: safeArea)
        
        // MARK: Back button
        NSLayoutConstraint.activate([
            btnBack.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            btnBack.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)
        ])
        
        setupContainerView()
    }
    
    // MARK: ScrollView Container
    private func setupContainerView() {
        
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        setupStackView()
    }
    
    // MARK: First StackView
    private func setupStackView() {
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
        
        // MARK: Main Stackview Elements
        setupViewLogo()
        setupTitle()
        setupFeaturedText()
        setupEmailTextField()
        setupNextButton()
        setupFeedbackBanner()
    }
    
    // MARK: Lock Logo
    private func setupViewLogo() {
        
        NSLayoutConstraint.activate([
            viewLogo.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 10),
            viewLogo.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -10),
        ])
    }
    
    // MARK: Title
    private func setupTitle() {
        
        NSLayoutConstraint.activate([
            title.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 10),
            title.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -10),
        ])
    }
    
    // MARK: Featured Text
    private func setupFeaturedText() {
        
        NSLayoutConstraint.activate([
            featuredText.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 35),
            featuredText.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -35),
        ])
    }
    
    // MARK: Email Text Field
    private func setupEmailTextField() {
        
        NSLayoutConstraint.activate([
            emailTextField.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 10),
            emailTextField.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -10),
        ])
    }
    
    // MARK: Next Button
    private func setupNextButton() {
        
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])
    }
    
    // MARK: Feedback Banner
    private func setupFeedbackBanner() {
        
        NSLayoutConstraint.activate([
            banner.widthAnchor.constraint(equalTo: featuredText.widthAnchor),
            banner.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        setupBannerStackView()
        setupBannerLabel()
        setupRightSign()
    }
    
    // MARK: Banner StackView
    private func setupBannerStackView() {
        NSLayoutConstraint.activate([
            bannerStackView.topAnchor.constraint(equalTo: banner.topAnchor, constant: 20),
            bannerStackView.rightAnchor.constraint(equalTo: banner.rightAnchor, constant: -20),
            bannerStackView.bottomAnchor.constraint(equalTo: banner.bottomAnchor, constant: -20),
            bannerStackView.leftAnchor.constraint(equalTo: banner.leftAnchor, constant: 15),
        ])
    }
    
    // MARK: Banner Label
    private func setupBannerLabel() {
        NSLayoutConstraint.activate([
            bannerLabel.topAnchor.constraint(equalTo: bannerStackView.topAnchor),
//            bannerLabel.rightAnchor.constraint(equalTo: rightSign.leftAnchor, constant: 15),
            bannerLabel.bottomAnchor.constraint(equalTo: bannerStackView.bottomAnchor),
            bannerLabel.leftAnchor.constraint(equalTo: bannerStackView.leftAnchor),
        ])
    }
    
    // MARK: Right Sign
    private func setupRightSign() {
        NSLayoutConstraint.activate([
            rightSign.topAnchor.constraint(equalTo: bannerStackView.topAnchor),
            rightSign.bottomAnchor.constraint(equalTo: bannerStackView.bottomAnchor),
            rightSign.rightAnchor.constraint(equalTo: bannerStackView.rightAnchor),
//            rightSign.leftAnchor.constraint(equalTo: bannerLabel.rightAnchor, constant: 15),
            rightSign.widthAnchor.constraint(equalToConstant: 15)
        ])
    }
}
