//  SearchHospitalsViewController.swift
//  Quick Wait Xib
//  Created by Juninho on 28/01/22.
import UIKit
import MapKit
import CoreLocation

class SearchHospitalsViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var btnUseMyLocation: UIButton!
    @IBOutlet weak var btnNavegationMap: UIButton!
    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var lbCurrentLocation: UILabel!
    @IBOutlet weak var viewLocationDisabled: UIView!
    @IBOutlet weak var tfTypedAddress: UITextField! {
        didSet {
            self.tfTypedAddress.delegate = self
        }
    }
    let locationManager = CLLocationManager()
    var centerCoordinate = CLLocationCoordinate2D()
    var centerCoordinateUser = CLLocationCoordinate2D()
    var searchHospitalsModel = [SearchHospitalsModel]()
    var locationHospitalModel = LocationHospitalModel()
    var counter: Int = 0
    var counterLocation: Int = 0
    var managerLongitude: String?
    var managerLatitude: String?
    var managerLongitudeDigitado: String?
    var managerLatitudeDigitado: String?
    var pin = MKPointAnnotation()
    var pinUser = MKPointAnnotation()
    var coordenadasTypedAddress = CLLocationCoordinate2D()

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardOnTap()
        checkLocationServices()
        self.myMapView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        showLoading(enable: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showLoading(enable: false)
        }
    }

    @IBAction func tapToBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func tapToNavegationMap(_ sender: UIButton) {
        openRouteOnMap()
    }

    @IBAction func tapToSettings(_ sender: UIButton) {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }

    @IBAction func tapToSearchHospitalResult(_ sender: UIButton) {
        self.tfTypedAddress.text = ""
        self.managerLatitudeDigitado = ""
        self.managerLongitudeDigitado  = ""
        self.counterLocation = 0
        checkLocationAuthorization()
        showLoading(enable: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            self.showLoading(enable: false)
            self.openResultSearchSenInformations()
        }
    }

    func openResultSearchSenInformations () {
        // APAGAR A LINHA TRAÇADA DO MAPA
        self.myMapView.overlays.forEach {
            if !($0 is MKUserLocation) {
                self.myMapView.removeOverlay($0)
            }
        }
        self.btnNavegationMap.isHidden = true
        let viewController = SearchHospitalsResultViewController(nibName: "SearchHospitalsResultViewController", bundle: nil)
        viewController.searchHospitalsModel = self.searchHospitalsModel
        if !tfTypedAddress.text!.isEmpty {
            viewController.managerLongitude = managerLongitudeDigitado
            viewController.managerLatitude = managerLatitudeDigitado
        } else {
            viewController.managerLongitude = managerLongitude
            viewController.managerLatitude = managerLatitude
        }

        viewController.delegate = self
        viewController.modalPresentationStyle = .popover
        self.present(viewController, animated: true, completion: nil)
    }

    func getLocation() {
        getCoordinateFrom(address: self.tfTypedAddress.text ?? "") { coordinate, error in
            guard let coordinate = coordinate, error == nil else {
                // alerta, endereço nao localizado
                print("Modelo")
                return
            }
            DispatchQueue.main.async {
                self.coordenadasTypedAddress = coordinate
                self.followUserLocation()
            }
        }
    }

    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> Void ) {
        CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1) }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.counterLocation += 1
        if self.counterLocation == 1 {
            if let latitude = manager.location?.coordinate.latitude {
                self.managerLatitude = "\(latitude)"
            }
            if let longitude = manager.location?.coordinate.longitude {
                self.managerLongitude = "\(longitude)"
            }
            if let lastLocation = locations.last {
                let geocoder = CLGeocoder()
                geocoder.reverseGeocodeLocation(lastLocation) { [weak self] (placemarks, error) in
                    if error == nil {
                        if let firstLocation = placemarks?[0] { // get the city name
                            //                            print("meu Cidade \(firstLocation.locality)")
                            self?.lbCurrentLocation.text = "\(firstLocation.name ?? "") \(firstLocation.locality ?? "") \(firstLocation.administrativeArea ?? "")"
                        }
                    }
                }
            }
        }
    }

    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            checkLocationAuthorizationTrue()
        case .denied:
            print("Permissão Negada")
            self.viewLocationDisabled.isHidden = false
            self.btnUseMyLocation.isUserInteractionEnabled = false
            self.lbCurrentLocation.isHidden = true
            self.tfTypedAddress.isUserInteractionEnabled = false
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            // sempre autorizado
            checkLocationAuthorizationTrue()
        default: break
        }
    }

    func checkLocationAuthorizationTrue() {
        self.viewLocationDisabled.isHidden = true
        self.btnUseMyLocation.isUserInteractionEnabled = true
        self.lbCurrentLocation.isHidden = false
        self.tfTypedAddress.isUserInteractionEnabled = true
        myMapView.showsUserLocation = true
        followUserLocation()
        locationManager.startUpdatingLocation()
    }

    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // the user didn't turn it on
        }
    }

    func followUserLocation() {

        if !tfTypedAddress.text!.isEmpty {
            let region = MKCoordinateRegion.init(center: self.coordenadasTypedAddress, latitudinalMeters: 1000, longitudinalMeters: 1000)
            print("a regiao ", region)
            myMapView.setRegion(region, animated: true)
            self.searchHospitalsModel.removeAll()
            self.counter = 0
            self.counterLocation = 0
            self.managerLongitudeDigitado = "\(self.coordenadasTypedAddress.longitude)"
            self.managerLatitudeDigitado = "\(self.coordenadasTypedAddress.latitude)"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.searchHospitalInMap(region)
                print("a regiao final")
            }
        } else {
            if let location = locationManager.location?.coordinate {
                let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
                print("a regiao usuario ", region)
                self.searchHospitalsModel.removeAll()
                self.counter = 0
                self.counterLocation = 0
                //    myMapView.removeAnnotations(myMapView.annotations)
                myMapView.setRegion(region, animated: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.searchHospitalInMap(region)
                }
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }

    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func searchHospitalInMap(_ region: MKCoordinateRegion) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = "hospital"
        searchRequest.region = myMapView.region
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, _) in
            guard let response = response else {
                // Handle the error.
                print("Nenhum Hospital próixmo a você")
                return
            }
            self.counter += 1
            if self.counter == 1 {
                for item in response.mapItems {
                    if let name = item.name,
                       let location = item.placemark.location {
                        self.searchHospitalsModel.append(.init(nome: name,
                                                               latitude: "\(location.coordinate.latitude)",
                                                               longitude: "\(location.coordinate.longitude)", endereco: item.placemark.title ?? ""))
                        let userCoordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                        let pino = MKPointAnnotation()
                        let centerCoordinateUser = userCoordinate
                        pino.coordinate = centerCoordinateUser
                        self.myMapView.addAnnotation(pino)
                    }
                }
            }
        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        if annotation is MKUserLocation {
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.image = UIImage(named: "mapPinIcon")
        } else {
            annotationView?.annotation = annotation
        }
        if annotation.coordinate.latitude == Double(self.managerLatitudeDigitado ?? "") {
            annotationView?.canShowCallout = true
            annotationView?.image = UIImage(named: "iconLocation")
        } else {
            annotationView?.canShowCallout = true
            annotationView?.image = UIImage(named: "mapPinIcon")
        }
        return annotationView
    }
}

extension SearchHospitalsViewController {
    func openRouteOnMap() {
        var appleURL = ""
        var googleURL = ""
        var wazeURL = ""

        appleURL = "http://maps.apple.com/?daddr="
        + "\(self.locationHospitalModel.address?.replacingOccurrences(of: " ", with: "+").folding(options: .diacriticInsensitive, locale: .current) ?? "")"
        googleURL = "comgooglemaps://?daddr="
         + "\(self.locationHospitalModel.address?.replacingOccurrences(of: " ", with: "+").folding(options: .diacriticInsensitive, locale: .current) ?? "")&directionsmode=driving"
        wazeURL = "waze://?ll=\(self.locationHospitalModel.latitude ?? ""),\(self.locationHospitalModel.longitude ?? "")&navigate=false"
        let googleItem = ("Google Map", URL(string: googleURL)!)
        let wazeItem = ("Waze", URL(string: wazeURL)!)
        var installedNavigationApps = [("Apple Maps", URL(string: appleURL)!)]

        if UIApplication.shared.canOpenURL(googleItem.1) {
            installedNavigationApps.append(googleItem)
        }
        if UIApplication.shared.canOpenURL(wazeItem.1) {
            installedNavigationApps.append(wazeItem)
        }
        let alert = UIAlertController(title: "Criar rota para o endereço do hospital", message: nil, preferredStyle: .actionSheet)
        for app in installedNavigationApps {
            let button = UIAlertAction(title: app.0, style: .default, handler: { _ in
                UIApplication.shared.open(app.1, options: [:], completionHandler: nil)
            })
            alert.addAction(button)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}

extension SearchHospitalsViewController: UITextFieldDelegate {
    // Return do teclado
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        let annotations = self.myMapView.annotations.filter({ !($0 is MKUserLocation) })
        self.myMapView.removeAnnotations(annotations)
        getLocation()
        showLoading(enable: true)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            let userCoordinate = CLLocationCoordinate2D(latitude: Double(self.managerLatitudeDigitado ?? "") ?? 0,
                                                        longitude: Double(self.managerLongitudeDigitado ?? "") ?? 0)
            self.centerCoordinateUser = userCoordinate
            self.pinUser.coordinate = self.centerCoordinateUser
            self.myMapView.addAnnotation(self.pinUser)
            self.showLoading(enable: false)
            self.openResultSearchSenInformations()
        }
        return false
    }
}

extension SearchHospitalsViewController: PlotRouteOnMapDelegate {

    func plotRouteOnMap(locationHospital: LocationHospitalModel) {

        self.locationHospitalModel = locationHospital
        let latitudeHospital = Double(self.locationHospitalModel.latitude ?? "")
        let longitudeHospital = Double(self.locationHospitalModel.longitude ?? "")
        let hospitalCoordinate = CLLocationCoordinate2D(latitude: latitudeHospital!, longitude: longitudeHospital!)
        var latitudeUser = Double()
        var longitudeUser = Double()

        if !tfTypedAddress.text!.isEmpty {
            latitudeUser = Double(self.managerLatitudeDigitado ?? "") ?? 0.0
            longitudeUser = Double(self.managerLongitudeDigitado ?? "") ?? 0.0
        } else {
            latitudeUser = Double(self.managerLatitude ?? "") ?? 0.0
            longitudeUser = Double(self.managerLongitude ?? "") ?? 0.0
        }

        let userCoordinate = CLLocationCoordinate2D(latitude: latitudeUser, longitude: longitudeUser)
        centerCoordinate = hospitalCoordinate
        pin.coordinate = centerCoordinate
        myMapView.addAnnotation(pin)
        showRouteOnMap(pickupCoordinate: userCoordinate, destinationCoordinate: hospitalCoordinate)
        btnNavegationMap.isHidden = false
    }

    // FUNÇÃO PARA ALTERAR A COR E A LARGURA DA LINHA ENTRE UM PINO E OUTRO
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor(red: (18/255), green: (161/255), blue: (167/255), alpha: 1.0)
        renderer.lineWidth = 3.0
        return renderer
    }

    func showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {

        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: pickupCoordinate, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate, addressDictionary: nil))
        request.requestsAlternateRoutes = true
        request.transportType = .automobile

        let directions = MKDirections(request: request)

        directions.calculate { [unowned self] response, _ in
            guard let unwrappedResponse = response else {
                return
            }
            // for getting just one route
            if let route = unwrappedResponse.routes.first {
                // show on map
                print("rota", route)
                self.myMapView.addOverlay(route.polyline)
            }
        }
    }
}
