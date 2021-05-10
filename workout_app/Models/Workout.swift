//
//  Workout.swift
//  workout_app
//
//  Created by Denis Feier on 10.05.2021.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct Workout {
    let workoutName: String
    let calories: Int
    let dateOfWorkout: String
    let duration: String
    let imageData: String?
    
    static func getWorkouts(complition: @escaping ([Workout]) -> Void, error: @escaping (String) -> Void) {
        var workouts: [Workout] = []
        if let user = Auth.auth().currentUser {
            let db = Firestore.firestore()
            
            let collRef = db.collection("\(user.uid)")
            
            collRef.getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                        error("Error getting documents")
                    } else {
                        for document in querySnapshot!.documents {
                            print("\(document.documentID) => \(document.data())")
                            let data = document.data()
                            let workout = Workout(
                                workoutName: data["workoutName"] as! String,
                                calories: data["calories"] as! Int,
                                dateOfWorkout: data["dateOfWorkout"] as! String,
                                duration: data["duration"] as! String,
                                imageData: data["imageUrl"] as? String
                            )
                            
                            workouts.append(workout)
                        }
                        
                        complition(workouts)
                    }
            }
        } else {
            error("No user session found")
        }
        
    }
    
    
}
