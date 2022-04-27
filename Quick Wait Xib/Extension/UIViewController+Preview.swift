//
//  UIViewController+Preview.swift
//  Quick Wait Xib
//
//  Created by Rafael Ortiz on 27/04/22.
//

import UIKit

#if DEBUG
import SwiftUI

@available(iOS 13, *)
extension UIViewController {
    
    private struct Preview: UIViewControllerRepresentable {
        // this variable is used for injecting the current view controller
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func toPreview() -> some View {
        // inject self (the current view controller) for the preview
        Preview(viewController: self)
    }
}
#endif

// MARK: Add this code above the viewcontroller to see the view

//#if DEBUG
//import SwiftUI
//
//@available(iOS 13, *)
//struct AnyVCPreview: PreviewProvider {
//
//    static var devices = ["iPhone 8", "iPhone 11 Pro Max"]
//
//    static var previews: some View {
//        if #available(iOS 15.0, *) {
//            ForEach(devices, id: \.self) { deviceName in
//                AnyViewController().toPreview().previewDevice(PreviewDevice(rawValue: deviceName))
//                    .previewDisplayName(deviceName)
//            }
//            .previewInterfaceOrientation(.portraitUpsideDown)
//        } else {
//            // Fallback on earlier versions
//            ForEach(devices, id: \.self) { deviceName in
//                AnyViewController().toPreview().previewDevice(PreviewDevice(rawValue: deviceName))
//                    .previewDisplayName(deviceName)
//            }
//        }
//    }
//}
//#endif
