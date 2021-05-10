//
//  HomeVC.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import UIKit

class HomeVC: UIViewController {

    var homeView = HomeView()
    
    var tableView: UITableView!
    
    var workouts: [Workout] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = homeView.tableView
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        addView(homeView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Workout.getWorkouts { [weak self] workoutsFromFB in
            
            guard let strongSelf = self else { return }
            
            strongSelf.workouts = workoutsFromFB
            strongSelf.tableView.reloadData()
        } error: { [weak self] messageErr in
            
            guard let strongSelf = self else { return }
            
            strongSelf.showAlert(message: messageErr)
        }

        
    }

}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell") as! WorkoutCell
        
        let workout = workouts[indexPath.row]
        
        cell.workoutDate.text = workout.dateOfWorkout
        cell.workoutName.text = workout.workoutName
        
        if let stringURL = workout.imageData, !stringURL.isEmpty {
            let url = URL(string: stringURL)
            let data = try? Data(contentsOf: url!)
            let image = UIImage(data: data!)!
            
            let targetSize = CGSize(width: 70, height: 90)

            let scaledImage = image.scalePreservingAspectRatio(
                targetSize: targetSize
            )
            
            cell.imageView?.image = scaledImage
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let workout = workouts[indexPath.row]
        
        let vc = DetailsVC()
        
        vc.workout = workout
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

