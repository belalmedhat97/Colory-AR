//
//  ColorsCollectionViewCell.swift
//  Colory
//
//  Created by belal medhat on 31/01/2023.
//

import UIKit

class ColorsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var colorHexlbl: UILabel!
    @IBOutlet weak var colorNamelbl: UILabel!
    @IBOutlet weak var colorDetailsVI: UIView!
    @IBOutlet weak var colorsBg: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        colorsBg.layer.cornerRadius = 10
        colorsBg.clipsToBounds = true
    }
    func setCellData(bgColor:String,name:String,hex:String){
        colorHexlbl.text = hex
        colorNamelbl.text = name
        colorsBg.backgroundColor = UIColor(hexString: bgColor)
    }
}
