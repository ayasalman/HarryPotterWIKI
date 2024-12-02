//
//  CharactersTableViewCell.swift
//  HarryPotterWIKI
//
//  Created by Aya on 30/11/2024.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var charactersNameLabel: UILabel!
    @IBOutlet weak var characterSortLabel: UILabel!
    @IBOutlet weak var characterDateOfBirthLabel: UILabel!
    func setupCell(photo:UIImage,name:String,sort:String,dateOfBirth:String) {
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
