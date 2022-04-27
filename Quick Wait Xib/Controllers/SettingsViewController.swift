//
//  SettingsViewController.swift
//  Quick Wait Xib
//
//  Created by Juninho on 02/03/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var mynameisjo: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tapToback(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapToDeveloper(_ sender: UIButton) {
        let viewController = DevelopersViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
