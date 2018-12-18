//
//  PlayersViewController.swift
//  SportsPlayersApp
//
//  Created by Gema Virginia Toyos Lanza on 17/12/18.
//  Copyright © 2018 Gema Toyos. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var players = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlayerNetworking.getPlayers { (response) in
            let players = response.players
            //print(players)
            self.players = players
            self.tableView.reloadData()
        }
    }
}

extension PlayersViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell") as? PlayerCell else {
            return UITableViewCell()
        }
        let player = players[indexPath.row]
        cell.configure(withPlayer: player)
        return cell
    }
}

extension PlayersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
