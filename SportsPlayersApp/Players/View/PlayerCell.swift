//
//  PlayerCell.swift
//  SportsPlayersApp
//
//  Created by Gema Virginia Toyos Lanza on 17/12/18.
//  Copyright © 2018 Gema Toyos. All rights reserved.
//

import UIKit


class PlayerCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var playerImage: UIImageView!
    
    func configure(withPlayer player: Player) {
        titleLabel.text = player.name
        surnameLabel.text = player.surname
        dateLabel.text = player.date
        self.playerImage.image = UIImage(named: "iconimg")
        let url = URL(string: player.image)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            if data != nil{
                DispatchQueue.main.async {
                    self.playerImage.image = UIImage(data: data!)
                }
            }

        }
    }
    
}
