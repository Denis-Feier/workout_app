//
//  WorkoutVC.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import UIKit

class WorkoutVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let workout = WorkoutView()
        addView(workout)
    }

}
