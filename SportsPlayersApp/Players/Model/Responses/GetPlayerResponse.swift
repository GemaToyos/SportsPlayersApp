//
//  GetPlayerResponse.swift
//  SportsPlayersApp
//
//  Created by Gema Virginia Toyos Lanza on 17/12/18.
//  Copyright © 2018 Gema Toyos. All rights reserved.
//

import Foundation

struct GetPlayerResponse {
    
    let players: [Player]
    
    init(json: Any) throws {
        guard let array = json as? [[String: Any]] else { throw NetworkingError.someError }
        var players = [Player]()
        for item in array {
            guard let playersList = item["players"] as? [[String: Any]] else { throw NetworkingError.someError }
            guard let sport = item["title"] as? String else { throw NetworkingError.someError }
                for p in playersList {
                    guard let player = Player(dict: p, sport: sport) else { continue }
                    players.append(player)
                }
        }
        self.players = players
    }
    
}
