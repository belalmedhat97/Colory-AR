//
//  ColorsManager.swift
//  Colory
//
//  Created by belal medhat on 31/01/2023.
//

import Foundation
protocol JsonReaderProtocol{
    func returnColors() -> [ColorsModel]
}
class ColorsManager:JsonReaderProtocol {
    private var Colors = [ColorsModel]()
    
    init(){
        ReadJsonFile()
    }
    private func ReadJsonFile(){
       do {
        if let bundlePath = Bundle.main.url(forResource: "Colors", withExtension: "json") {
            let data = try Data(contentsOf: bundlePath)
            let pars = try JSONDecoder().decode([ColorsModel].self, from: data)
            self.Colors = pars
            }
       } catch {
           print(error)
       }
    }
    
    func returnColors() -> [ColorsModel]{
        self.Colors
    }
}
