//
//  MovieTableViewCell.swift
//  testTabBar
//
//  Created by Lisbeth Eslava on 9/03/20.
//  Copyright © 2020 Lisbeth Eslava. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    static let identifier:String = "MovieTableViewCell"
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension MovieTableViewCell{
    func setupCell(){
        titleLabel.font = UIFont(name: "Palatino", size: 20.0)
        titleLabel.textColor = UIColor.darkGray
        descriptionLabel.font = UIFont(name: "Palatino", size: 16.0)
        descriptionLabel.textColor = UIColor.lightGray
    }
    
    func setText(title: String){
        self.titleLabel.text = title
    }
}
