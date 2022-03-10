//  SearchHospitalsResultTableViewCell.swift
//  Quick Wait Xib
//  Created by Juninho on 31/01/22.

import UIKit

class SearchHospitalsResultTableViewCell: UITableViewCell {
    
    var searchHospitalsModel = SearchHospitalsModel()
    
    @IBOutlet weak var ivStatusHospital: UIImageView!
    @IBOutlet weak var lbStatusHospital: UILabel!
    @IBOutlet weak var lbNameHospital: UILabel!
    @IBOutlet weak var lbAddressHospital: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(mapa: SearchHospitalsModel) {
     //   print("Aqui Nome", mapa.nome)
        self.lbNameHospital.text = mapa.nome
        self.lbAddressHospital.text = mapa.endereco
    }
}
