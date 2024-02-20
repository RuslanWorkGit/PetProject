//
//  MainMovieCell.swift
//  MVVMPatern
//
//  Created by Ruslan Liulka on 20.02.2024.
//

import UIKit

class MainMovieCell: UITableViewCell {

    //IBOtlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
