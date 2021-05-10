//
//  DetailsVC.swift
//  workout_app
//
//  Created by Denis Feier on 10.05.2021.
//

import UIKit

class DetailsVC: UIViewController {

    var detailsView = DetailsView()
    
    var workout: Workout?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView(detailsView)
        // Do any additional setup after loading the view.
        
        detailsView.workoutName.text = ""
        detailsView.workoutDate.text = ""
        detailsView.workoutDuration.text = ""
        detailsView.workoutCalories.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let work = workout {

            detailsView.workoutName.text = work.workoutName
            detailsView.workoutDate.text = work.dateOfWorkout
            detailsView.workoutDuration.text = work.duration
            detailsView.workoutCalories.text = "\(work.calories)"
            
            if let stringURL = work.imageData, !stringURL.isEmpty {
                let url = URL(string: stringURL)
                let data = try? Data(contentsOf: url!)
                let image = UIImage(data: data!)!
                
                let targetSize = CGSize(width: 70, height: 90)

                let scaledImage = image.scalePreservingAspectRatio(
                    targetSize: targetSize
                )
                
                detailsView.imageView?.image = scaledImage
                
            }
        }
        
    }

}
