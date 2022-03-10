//  SearchHospitalsResultViewController.swift
//  Quick Wait Xib
//  Created by Juninho on 31/01/22.

import UIKit
import CoreLocation

protocol PlotRouteOnMapDelegate: AnyObject {
    func plotRouteOnMap(locationHospital: LocationHospitalModel)
}

class SearchHospitalsResultViewController: UIViewController {

    @IBOutlet weak var lbNameHospital: UILabel!
    @IBOutlet weak var lbAddressHospital: UILabel!
    @IBOutlet weak var lbDistanceHospital: UILabel!
    @IBOutlet weak var viewTableView: UIView!
    @IBOutlet weak var viewTableViewResult: UIView!{
        didSet {
            self.viewTableViewResult.isHidden = true
        }
    }
    @IBOutlet weak var myTableView: UITableView!{
        didSet {
            self.myTableView.delegate = self
            self.myTableView.dataSource = self
        }
    }
    
    var managerLongitude: String?
    var managerLatitude: String?
    var changeView: Bool = true
    weak var delegate: PlotRouteOnMapDelegate?
    var locationHospitalModel = LocationHospitalModel()
    var searchHospitalsModel = [SearchHospitalsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Registrar e carregar nib na view
        let cellNib = UINib(nibName: "SearchHospitalsResultTableViewCell", bundle: nil)
        self.myTableView.register(cellNib, forCellReuseIdentifier: "celula")
    }
    
    @IBAction func taToConfirm(_ sender: UIButton) {
        
        self.delegate?.plotRouteOnMap(locationHospital: locationHospitalModel)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapToClouse(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
    func changeOfView() {
        
        if self.changeView {
            self.viewTableViewResult.isHidden = false
            self.viewTableView.isHidden = true
            self.changeView = false
        } else {
            self.viewTableViewResult.isHidden = true
            self.viewTableView.isHidden = false
            self.changeView = true
        }
    }
    
    @IBAction func tapToBack(_ sender: UIButton) {
        changeOfView()
    }
}

extension SearchHospitalsResultViewController {
    
    func getInfoHospital(_ infoHospital: SearchHospitalsModel) {
        self.lbNameHospital.text = infoHospital.nome
        self.lbAddressHospital.text = infoHospital.endereco
        self.locationHospitalModel.longitude = infoHospital.longitude ?? ""
        self.locationHospitalModel.latitude = infoHospital.latitude ?? ""
        self.locationHospitalModel.address = infoHospital.endereco ?? ""
        DistanceBeteweenKm(latitude: infoHospital.latitude ?? "", longitude: infoHospital.longitude ?? "")
    }
    
    func DistanceBeteweenKm(latitude: String, longitude: String) {
        let coordinate₀ = CLLocation(latitude: (Double(latitude))!, longitude:  (Double(longitude))!)
        let coordinate₁ = CLLocation(latitude: (Double(self.managerLatitude ?? ""))!, longitude:  (Double(self.managerLongitude ?? ""))!)
        let distance = coordinate₀.distance(from: coordinate₁) / 1000
        
        //Display the result in km
        self.lbDistanceHospital.text = String(format: "%.01fkm", distance)
    }
}

extension SearchHospitalsResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.searchHospitalsModel.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        getInfoHospital(self.searchHospitalsModel[indexPath.row])
        changeOfView()
        self.myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for:
                                                    indexPath) as! SearchHospitalsResultTableViewCell
        
        cell.setupCell(mapa: self.searchHospitalsModel[indexPath.row])
        
        return cell
    }
}
