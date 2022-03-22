//
//  NewsResultViewController.swift
//  Quick Wait Xib
//
//  Created by Juninho on 22/02/22.
//

import UIKit
import SDWebImage

class NewsResultViewController: UIViewController {
    
    @IBOutlet weak var ivNews: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPublishedAt: UILabel!
    @IBOutlet weak var lbContent: UILabel!
    
    var newsViewModel: Article?
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lbName.text  = newsViewModel?.source.name ?? ""
        let url = NSURL(string: newsViewModel?.url ?? "")
        ivNews.sd_setImage(with: url! as URL)
        self.lbDescription.text  = newsViewModel?.articleDescription ?? ""
        self.lbTitle.text  = newsViewModel?.title ?? ""
        self.lbPublishedAt.text  = newsViewModel?.publishedAt ?? ""
        self.lbContent.text  = newsViewModel?.content ?? ""
    }
    
    @IBAction func tapToBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
