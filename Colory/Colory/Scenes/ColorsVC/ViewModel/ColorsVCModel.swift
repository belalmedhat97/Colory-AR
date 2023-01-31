//
//  ColorsVCModel.swift
//  Colory
//
//  Created by belal medhat on 31/01/2023.
//

import Foundation
import Combine
protocol ColorsVCMProtocol{
    var colorsData:[ColorsModel] {get set}
    func getColors()
}
class ColorsVCModel:ColorsVCMProtocol,ObservableObject{
    
    private var colorsReader:JsonReaderProtocol?
    @Published var colorsData:[ColorsModel] = []
    init(reader:JsonReaderProtocol){
        self.colorsReader = reader
    }
    func getColors() {
        colorsData = colorsReader?.returnColors() ?? [ColorsModel]()
    }
    
    
}
