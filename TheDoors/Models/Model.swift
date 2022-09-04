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
}

class Model{
    
    var door = [Doors]()
    
    init(){
        data()
        
    }
    
    func data(){
        let door1 = Doors(doorTitle: "Front door", doorDescr: "Office")
        let door2 = Doors(doorTitle: "Front door", doorDescr: "Home")
        let door3 = Doors(doorTitle: "Front door", doorDescr: "Country house")
        let door4 = Doors(doorTitle: "Door to yard", doorDescr: "Country house")
        let door5 = Doors(doorTitle: "Front door", doorDescr: "Flat")
        self.door = [door1, door2, door3, door4, door5]
       
    }
}

