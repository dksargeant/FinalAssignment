//
//  ActivityModel.swift
//  Rocco_Bored
//
//  Created by Rocco Alexander on 2021-04-20.
//  033315151

import Foundation
class ActivityModel{
    var name: String
    init(){
        self.name = ""
    }
    
    init?(name: String){
        if(name.isEmpty){
            return nil
        }
        self.name = name
    }
}
