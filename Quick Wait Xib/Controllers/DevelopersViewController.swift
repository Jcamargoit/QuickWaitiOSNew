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
        viewModel.bindViewModel()
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
            ) { index, data, cell in
                if index == 0 {
                    cell.border.isHidden = false
                }
                cell.configCell(data)
            }.disposed(by: disposed)

        presentationView.developersCollection.rx.itemSelected.bind { value in
            let item = self.viewModel.dataSource.value
            self.configurePresentationView(person: item[value.row])
        }.disposed(by: disposed)

        self.presentationView.developersCollection.rx.itemSelected
                    .subscribe(onNext: { [weak self] indexPath in
                        
                        for count in 0 ... (self?.viewModel.dataSource.value.count ?? 0) {
                            let cell = self?.presentationView
                                            .developersCollection
                                            .cellForItem(at: IndexPath(row: count, section: 0)) as? DevelopersCollectionViewCell
                            cell?.border.isHidden = true
                        }
                        let cell = self?.presentationView.developersCollection.cellForItem(at: indexPath) as? DevelopersCollectionViewCell
                        cell?.border.isHidden = false
                    }).disposed(by: disposed)

        self.viewModel.dataSource.bind { value in
            if !value.isEmpty {
                self.configurePresentationView(person: value[0], first: true)
            }
        }.disposed(by: disposed)
        
        self.presentationView.backButton.rx.tapGesture().when(.recognized).bind { _ in
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: disposed)
    }

    func configurePresentationView(person: DeveloperModelElement, first: Bool = false) {
        self.presentationView.updateTexts(person: person)
    }

}
