//  HomeViewController.swift
//  Quick Wait Xib
//  Created by Juninho on 28/01/22.

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var ivPhotoProfile: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    
    //private var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapToSearchHospitals(_ sender: UIButton) {
        let vc = SearchHospitalsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapToStickyNotes(_ sender: UIButton) {
    }
    
    @IBAction func tapToNews(_ sender: UIButton) {
        let vc = NewsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapToSettings(_ sender: UIButton) {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapToLogout(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("Deinit HomeViewController")
    }
}