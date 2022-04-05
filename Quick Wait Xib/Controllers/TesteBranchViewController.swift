//
//  TesteBranchViewController.swift
//  Quick Wait Xib
//
//  Created by Juninho on 22/02/22.
//

import UIKit

class TesteBranchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension UIImageView {

    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) // instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}
