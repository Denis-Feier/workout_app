//
//  WorkoutCell.swift
//  workout_app
//
//  Created by Denis Feier on 10.05.2021.
//

import UIKit

class WorkoutCell: UITableViewCell {

    @IBOutlet weak var workoutName: UILabel!
    @IBOutlet weak var workoutDate: UILabel!
    @IBOutlet weak var workoutImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
