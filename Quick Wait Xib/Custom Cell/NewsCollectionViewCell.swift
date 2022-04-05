//
//  NewsCollectionViewCell.swift
//  Quick Wait Xib
//
//  Created by Juninho on 16/02/22.
//

import UIKit
import SDWebImage

class NewsCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var shadowView: UIView! {
        didSet {
            self.shadowView.backgroundColor = .clear
            self.shadowView.layer.cornerRadius = 4.0
        }
    }
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!

    // MARK: - Cell Functionsa
    override func awakeFromNib() {
        super.awakeFromNib()
        CAGradientLayer.setDropShadow(layer: self.shadowView.layer, radius: 4.0, opacity: 0.8)
    }

    func configure(map: Article) {
        let url = NSURL(string: map.url ?? "")
        self.bannerImage.sd_setImage(with: url! as URL)
        self.lbTitle.text = map.title ?? ""

    }

    func nova(tamanho: Bool) {
        print("o tamanho que vem ", tamanho)
    }
}

extension CALayer {

    public static func setDropShadow(layer: CALayer, radius: CGFloat, opacity: Float) {
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
    }

    public static func setDropShadowBottom(layer: CALayer, opacity: Float, color: UIColor? = nil) {
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = opacity
        layer.shadowRadius = 5.0
    }

    public static func removeDropShadow(layer: CALayer) {
        CALayer.setDropShadow(layer: layer, radius: 10, opacity: 0)
    }
}
