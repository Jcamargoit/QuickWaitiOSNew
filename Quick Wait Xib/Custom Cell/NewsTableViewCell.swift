//  NewsTableViewCell.swift
//  Quick Wait Xib
//  Created by Framework on 17/02/22.

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivCell: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPublishedAt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //Testando git
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupCell(map: Article) {
        
        let url = NSURL(string: map.url ?? "")
        self.ivCell.sd_setImage(with: url! as URL)
        self.lbTitle.text = map.title
        self.lbName.text = map.source.name
        self.lbPublishedAt.text = map.publishedAt
    }
}
