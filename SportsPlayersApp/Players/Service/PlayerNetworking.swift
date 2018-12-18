//
//  PlayerNetworking.swift
//  SportsPlayersApp
//
//  Created by Gema Virginia Toyos Lanza on 17/12/18.
//  Copyright © 2018 Gema Toyos. All rights reserved.
//

import Foundation

class PlayerNetworking {
    private init() {}
    
    static func getPlayers(completion: @escaping (GetPlayerResponse) -> Void) {
        guard let url = URL(string: "https://api.myjson.com/bins/66851") else { return }
        NetworkingService.shared.getData(fromURL: url) { (json) in
            do {
                let response = try GetPlayerResponse(json: json)
                completion(response)
            } catch {}
        }
    }
}
