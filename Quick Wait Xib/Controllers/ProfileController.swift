//  ProfileController.swift
//  Quick Wait Xib
//  Created by Juninho on 13/04/22.

import Foundation
import RxSwift
import RxGesture

class ProfileController: UIViewController {
    
   // private lazy var profileViewModel = ProfileViewModel()
    var presentationView: ProfileView = ProfileView()
    var disposable: DisposeBag = DisposeBag()
    var imagBase64 = ImagBase64()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presentationView.labelNameAndSurname.text = UserDefaults.standard.string(forKey: "userName") ?? "\(self.presentationView.labelNameAndSurname.text!)"
        self.presentationView.labelUserMail.text = UserDefaults.standard.string(forKey: "userMail") ?? "\(self.presentationView.labelUserMail.text!)"
     
        self.loadUserImage()

    }
    
    func bindView() {
        self.presentationView.imageReturn.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToReturn()
        }.disposed(by: disposable)
        
        self.presentationView.imageUser.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToImage()
        }.disposed(by: disposable)
        
        self.presentationView.labelLogout.rx.tapGesture().when(.recognized).bind { _ in
            self.tapToLogout()
        }.disposed(by: disposable)
        
        
    }
    
    func tapToReturn() {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func tapToImage() {
        upLoadUserPhoto()
    }
    
    func tapToLogout() {
        
        let alert = UIAlertController(title: "Sair da sua conta?", message: "Lembramos que todos seus dados serão apagados do dispositivo", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
        })
        alert.addAction(cancel)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            
            UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userToken.rawValue)
            UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userName.rawValue)
            UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userMail.rawValue)
            UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userId.rawValue)
            UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userImageProfile.rawValue)
            
            let viewController = ChoiceViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        })
      
        
        
        alert.addAction(ok)
  
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    func loadUserImage() {
        if let image = UserDefaults.standard.string(forKey: UserDefaultsKeys.userImageProfile.rawValue){
            let imageResult = imagBase64.convertBase64ToImage(imageString: image)
            self.presentationView.imageUser.image = imageResult
    //        self.profileViewModel.blurImageView(image: self.presentationView.imageTopBackground)
            self.presentationView.imageTopBackground.image = imageResult 
            self.presentationView.imageUserAdd.isHidden = true
        }
    }
    
    func upLoadUserPhoto()  {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Câmera", style: .default , handler:{ (UIAlertAction)in
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = .camera
            self.present(picker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Galeria", style: .default , handler:{ (UIAlertAction)in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler:{ (UIAlertAction)in
        }))
        self.present(alert, animated: true, completion: {
        })
    }
}

extension ProfileController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImageFromPicker: UIImage?
        selectedImageFromPicker = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        
        if let selectedImage = selectedImageFromPicker {
            self.presentationView.imageUser.image = selectedImage
            self.presentationView.imageTopBackground.image = selectedImage
          //   self.profileViewModel.blurImageView(image: self.presentationView.imageTopBackground)
             
            
  
                UserDefaults.standard.set(self.imagBase64.convertImageToBase64(image: selectedImage), forKey: UserDefaultsKeys.userImageProfile.rawValue)
      
            
            
        }
        picker.dismiss(animated: true, completion: nil)
    }
    //Retorno quando cancelar a ação
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
    
}
