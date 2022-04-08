//
//  DevelopersViewController.swift
//  Quick Wait Xib
//
//  Created by Framework Digital on 06/04/22.
//

import Foundation
import RxSwift

class DevelopersViewController: UIViewController {
    var presentationView: DeveloperView = DeveloperView()
    var disposed: DisposeBag = DisposeBag()
    private var viewModel = DeveloperViewModel()

    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    func bindView() {
        viewModel.dataSource
            .bind(
                to: presentationView
                    .developersCollection
                    .rx
                    .items(
                        cellIdentifier: DevelopersCollectionViewCell.identifier,
                        cellType: DevelopersCollectionViewCell.self
                    )
            ) { _, data, cell in
                cell.configCell(data)
            }.disposed(by: disposed)
    }
    
}
