//
//  Model.swift
//  TheDoors
//
//  Created by Admin on 01.09.2022.
//

import UIKit

public struct Doors {
    //var doorImgNAme: String
    var doorTitle: String
    var doorDescr: String
    var doorState: String
}

class Model{
    
    var door = [Doors]()
    
    init(){
        data()
    }
    
    func data(){
        let door1 = Doors(doorTitle: "Front door", doorDescr: "Office", doorState: "Unlocked")
        let door2 = Doors(doorTitle: "Front door", doorDescr: "Home", doorState: "Unlocked")
        let door3 = Doors(doorTitle: "Front door", doorDescr: "Country house", doorState: "Unlocked")
        
        self.door = [door1, door2, door3]
       
    }
}

