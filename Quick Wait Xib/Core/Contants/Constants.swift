//
//  Constants.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 16/03/22.
//

import UIKit

struct Constants {
    struct API {
        static let baseUrl = "http://localhost:8072/auth/api"
        static let urlUser = "http://localhost:8072/auth/api/auth/"
    }
}

struct K {
    struct Colors {
        static let mainBackground: UIColor = UIColor(red: 0.87, green: 1.00, blue: 1.00, alpha: 1.00)
        static let mainTitle: UIColor = UIColor(red: 18/255, green: 161/255, blue: 167/255, alpha: 1.00)
        static let mainFeaturedText: UIColor = UIColor(red: 18/255, green: 161/255, blue: 167/255, alpha: 1.00)
        static let mainTextField: UIColor = UIColor(red: 18/255, green: 161/255, blue: 167/255, alpha: 1.00)
        static let mainFormButton: UIColor = UIColor(red: 0.18, green: 0.75, blue: 0.76, alpha: 1.00)
        static let bannerText: UIColor = UIColor.black
    }
    
    struct Fonts {
        static let mainTitle: UIFont? = UIFont.init(name: "QuicksandBook-Regular", size: 30)
        static let mainFeaturedText: UIFont? = UIFont.init(name: "QuicksandBook-Regular", size: 20)
        static let mainTextField: UIFont? = UIFont.init(name: "QuicksandBook-Regular", size: 18)
        static let bannerText: UIFont? = UIFont.init(name: "QuicksandBook-Regular", size: 14)
    }
}

