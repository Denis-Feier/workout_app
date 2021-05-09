//
//  WorkoutProtocol.swift
//  workout_app
//
//  Created by Denis Feier on 09.05.2021.
//

import Foundation
import UIKit

protocol WorkoutProtocol {
    func openSelector(completion: ((UIImage) -> Void)?)
    func setTextFieldsDelegate(fields: [UITextField])
    func uploadToFirebase(workout: SubmitWorkoutSnap)
}
