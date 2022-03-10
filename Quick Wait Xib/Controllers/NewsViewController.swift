//  NewsViewController.swift
//  Quick Wait Xib
//  Created by Juninho on 14/02/22.

import UIKit

class NewsViewController: UIViewController {
    
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var viewStackCollection: UIView!
    @IBOutlet weak var bannerPageControl: UIPageControl!
    @IBOutlet weak var tamanhoCollection: NSLayoutConstraint!
    @IBOutlet weak var myTableView: UITableView!{
        didSet {
            self.myTableView.delegate = self
            self.myTableView.dataSource = self
            //Registrar e carregar nib na view
            let cellNib = UINib(nibName: "NewsTableViewCell", bundle: nil)
            self.myTableView.register(cellNib, forCellReuseIdentifier: "cell")
        }
    }
    // MARK: - Spotlight Products
    @IBOutlet weak var featuredNewsCollectionView: UICollectionView! {
        didSet {
            self.featuredNewsCollectionView.backgroundColor = .clear
            self.featuredNewsCollectionView.dataSource = self
            self.featuredNewsCollectionView.delegate = self
            self.featuredNewsCollectionView.showsHorizontalScrollIndicator = false
            self.featuredNewsCollectionView.register(UINib(nibName: String(describing: NewsCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: NewsCollectionViewCell.self))
            flowLayout.sectionInset = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 20
            self.featuredNewsCollectionView.collectionViewLayout = flowLayout
        }
    }
    
    var titleNews = [String]()
    var btnNews = [UIButton]()
    var dataAndFontNews = [String]()
    var imageNews = [UIImage]()
    var indexOfCellBeforeDragging = 0
    var flowLayout = UICollectionViewFlowLayout()
    var newsViewModel = NewsViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading(enable: true)
        self.bannerPageControl.numberOfPages = 4
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.setup()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showLoading(enable: false)
    }
    
    func setup(){
   
        APIService().load(resource: NewsModel.Get) { [weak self] result in
              switch result {
              case .success(let orders):
            
                  self?.newsViewModel.newsViewModel = orders.articles
                  self?.showLoading(enable: false)
                  self?.enableButtons()
              //    self.bannerPageControl.ma  self?.newsViewModel.newsViewModel.count
               self?.myTableView.reloadData()
                  self?.featuredNewsCollectionView.reloadData()
                  
                  
           case .failure(let error):
               print("Error ", error)
                  self?.showLoading(enable: false)
                  self?.enableButtons()
           }
       }
    }
    
    
    func enableButtons() {
        self.bannerPageControl.isHidden = false
        self.btnBack.isHidden = false
    }
    
    @IBAction func tapToBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func indexOfMajorCell() -> Int {
        let itemWidth = collectionView( // 1
            featuredNewsCollectionView,
            layout: featuredNewsCollectionView.collectionViewLayout,
            sizeForItemAt: IndexPath(item: 0, section: 0)
        ).width
        
        let proportionalOffset = featuredNewsCollectionView.collectionViewLayout.collectionView!.contentOffset.x / itemWidth
        let index = Int(round(proportionalOffset))
        let numberOfItems = featuredNewsCollectionView.collectionViewLayout.collectionView!.numberOfItems(inSection: 0)
        let safeIndex = max(0, min(numberOfItems - 1, index))
        return safeIndex
    }
}

extension NewsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = CGFloat(20.0)
        let availableWidth = self.view.frame.width - paddingSpace
        return CGSize(width: availableWidth, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let visibleRect = CGRect(origin: self.featuredNewsCollectionView.contentOffset, size: self.featuredNewsCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.featuredNewsCollectionView.indexPathForItem(at: visiblePoint) {
            self.bannerPageControl.currentPage = visibleIndexPath.row
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView == self.featuredNewsCollectionView {
            // Stop scrollView sliding:
            targetContentOffset.pointee = scrollView.contentOffset
            // calculate where scrollView should snap to:
            let indexOfMajorCell = self.indexOfMajorCell()
            // calculate conditions:
            let dataSourceCount = collectionView(self.featuredNewsCollectionView.collectionViewLayout.collectionView!, numberOfItemsInSection: 0)
            let swipeVelocityThreshold: CGFloat = 0.5 // after some trail and error
            let hasEnoughVelocityToSlideToTheNextCell = indexOfCellBeforeDragging + 1 < dataSourceCount && velocity.x > swipeVelocityThreshold
            let hasEnoughVelocityToSlideToThePreviousCell = indexOfCellBeforeDragging - 1 >= 0 && velocity.x < -swipeVelocityThreshold
            let majorCellIsTheCellBeforeDragging = indexOfMajorCell == indexOfCellBeforeDragging
            let didUseSwipeToSkipCell = majorCellIsTheCellBeforeDragging && (hasEnoughVelocityToSlideToTheNextCell || hasEnoughVelocityToSlideToThePreviousCell)
            if didUseSwipeToSkipCell {
                let indexPath = IndexPath(row: indexOfCellBeforeDragging, section: 0)
                self.featuredNewsCollectionView.collectionViewLayout.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            } else {
                // This is a much better way to scroll to a cell:
                let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
                self.featuredNewsCollectionView.collectionViewLayout.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.newsViewModel.newsViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: NewsCollectionViewCell.self), for: indexPath) as? NewsCollectionViewCell {
            
            if self.newsViewModel.newsViewModel.count > 0 {
                cell.configure(map: self.newsViewModel.newsViewModel(at: indexPath.row))
            }
            
         //   cell.configure(map: self.newsViewModel.newsViewModel(at: indexPath.row))
            
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = NewsResultViewController()
        vc.newsViewModel = newsViewModel.newsViewModel(at: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
        print("to clicando")
        
    }
}


extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.newsViewModel.newsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = NewsResultViewController()
        vc.newsViewModel = newsViewModel.newsViewModel(at: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:
                                                    indexPath) as! NewsTableViewCell
        
        if self.newsViewModel.newsViewModel.count > 0 {
            cell.setupCell(map: self.newsViewModel.newsViewModel(at: indexPath.row))
        }
        
        return cell
    }
}
