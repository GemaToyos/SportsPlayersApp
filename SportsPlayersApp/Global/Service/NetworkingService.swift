//
//  NetworkingService.swift
//  SportsPlayersApp
//
//  Created by Gema Virginia Toyos Lanza on 17/12/18.
//  Copyright © 2018 Gema Toyos. All rights reserved.
//

import Foundation

class NetworkingService {
    
    private init() {}
    static let shared = NetworkingService()
    
    func getData(fromURL url: URL, completion: @escaping (Any)->Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    completion(json)
                }
            } catch {}
        }
        task.resume()
    }
}
