//
//  WorkoutView.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import UIKit

class WorkoutView: UIView {

    @IBOutlet var containerView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    func configureView() {
        Bundle.main.loadNibNamed("WorkoutView", owner: self, options: nil)
        addSubviewWithContraints(containerView)
    }

}
