//
//  ShowLoading.swift
//  Quick Wait Xib
//
//  Created by Juninho on 08/02/22.
//

import Foundation
import UIKit



extension UIViewController {
    
    func showLoading(enable: Bool = true){
        let loadingVC = LoadingViewController()
        // Animate loadingVC over the existing views on screen
        loadingVC.modalPresentationStyle = .overCurrentContext
        
        // Animate loadingVC with a fade in animation
        loadingVC.modalTransitionStyle = .crossDissolve
        
        if enable {
            //inicio do load
            present(loadingVC, animated: true, completion: nil)
            
        }else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
