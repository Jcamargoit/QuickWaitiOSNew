//  HomeViewController.swift
//  Quick Wait Xib
//  Created by Juninho on 28/01/22.

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var ivPhotoProfile: UIImageView!{
        didSet {
            ivPhotoProfile.setImageRounded()
        }
    }
    @IBOutlet weak var lbName: UILabel!
    
    var imagBase64 = ImagBase64()

    override func viewDidLoad() {
        super.viewDidLoad()
      
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            self.loadUserImage()
        self.lbName.text = UserDefaults.standard.string(forKey: "userName") ?? "Nome"
    }

    func loadUserImage() {
        if let image = UserDefaults.standard.string(forKey: UserDefaultsKeys.userImageProfile.rawValue){
            let imageResult = imagBase64.convertBase64ToImage(imageString: image)
            self.ivPhotoProfile.image = imageResult
        }
    }
    
    
    @IBAction func tapToSearchHospitals(_ sender: UIButton) {
        let viewController = SearchHospitalsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func tapToStickyNotes(_ sender: UIButton) {
    }

    @IBAction func tapToNews(_ sender: UIButton) {
        let viewController = NewsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func tapToSettings(_ sender: UIButton) {
        let viewController = SettingsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func tapToLogout(_ sender: UIButton) {
  
    }
    

    deinit {
        print("Deinit HomeViewController")
    }
}
