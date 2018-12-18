//
//  Player.swift
//  SportsPlayersApp
//
//  Created by Gema Virginia Toyos Lanza on 17/12/18.
//  Copyright © 2018 Gema Toyos. All rights reserved.
//

import Foundation


struct Player {
    
    let name: String
    let surname: String
    let date: String
    let image: String
    let sport: String
    
    init?(dict: [String: Any], sport: String) {
        guard let name = dict["name"] as? String,
            let surname = dict["surname"] as? String,
            let image = dict["image"] as? String
            else {
                return nil
        }
        
        self.name = name
        self.surname = surname
        self.image = image
        let date = dict["date"] as? String
        if date != nil {
            self.date = date!
        } else {
            self.date = ""
        }
        self.sport = sport
    }
}
