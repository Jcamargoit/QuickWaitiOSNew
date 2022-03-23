//
//  UIView+Extensions.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 11/03/22.
//

import UIKit

extension UIView {
    
    var size: CGSize {
        return UIScreen.main.bounds.size
    }
    
    func pinToSuperviewEdges(_ edges: [Edge] = [.top, .left, .right, .bottom], constant: CGFloat = 0) {
        
        guard let superview = superview else { return }
        
        edges.forEach {
            switch $0 {
            case .top:
                topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
            case .left:
                leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
            case .right:
                rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant).isActive = true
            case .bottom:
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant).isActive = true
            }
        }
    }
    
    func pinToSafeArea(_ edges: [Edge] = [.top, .left, .right, .bottom], constant: CGFloat = 0, safeArea: UILayoutGuide) {
        
        edges.forEach {
            switch $0 {
            case .top:
                topAnchor.constraint(equalTo: safeArea.topAnchor, constant: constant).isActive = true
            case .left:
                leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: constant).isActive = true
            case .right:
                rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -constant).isActive = true
            case .bottom:
                bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -constant).isActive = true
            }
        }
    }
    
}

enum Edge {
    case left
    case top
    case right
    case bottom
}
