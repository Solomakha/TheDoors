//
//  Model.swift
//  TheDoors
//
//  Created by Admin on 01.09.2022.
//

import Foundation

class Model{
    var doorImgNAme: String
    var doorTitle: String
    var doorDescr: String
    
    init(doorImgName:String, doorTitle:String, doorDescr:String){
        self.doorImgNAme = doorImgName
        self.doorTitle = doorTitle
        self.doorDescr = doorDescr
    }
}
