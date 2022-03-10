//
//  MyLaunchViewController.swift
//  Quick Wait Xib
//
//  Created by Juninho on 21/01/22.
//

import UIKit

class MyLaunchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.navigationItem.title = ""
        title = "First Screen"
        let view = UINib(nibName: "MyLaunchScreen", bundle: .main).instantiate(withOwner: nil, options: nil).first as! UIView
        self.view.frame = view.bounds
        self.view.addSubview(view)
        

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            //Funciona
            let vc = ChoiceViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    deinit {
        print("Deinit MyLaunchViewController")
    }
}
