//
//  DetailsView.swift
//  workout_app
//
//  Created by Denis Feier on 10.05.2021.
//

import Foundation
import UIKit

class DetailsView: UIView {
    
    @IBOutlet var containerView: UIView!
    
    @IBOutlet weak var workoutName: UILabel!
    @IBOutlet weak var workoutDuration: UILabel!
    @IBOutlet weak var workoutDate: UILabel!
    @IBOutlet weak var workoutCalories: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    func configureView() {
        Bundle.main.loadNibNamed("DetailsView", owner: self, options: nil)
        addSubviewWithContraints(containerView)
    }
    
}
