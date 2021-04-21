//
//  Activity.swift
//  Rocco_Bored
//
//  Created by Rocco Alexander on 2021-04-20.
//  033315151

import Foundation
struct Activity : Codable {
    
//    Codable parameters
    var activityName:String
    
    
//    Init the strings and values
    init(){
        self.activityName = ""

    }
    
//    Enumeration to match key with API string
    enum CodingKeys : String, CodingKey{
        case activityName = "activity"
    }
    
//    Encode - Nothing to do for this app
    func encode(to encoder: Encoder) throws {
//        nothing
    }
    
//    Init from API
    init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        self.activityName = try response.decodeIfPresent(String.self, forKey: .activityName) ?? "No Activitis Available."
    }
}
