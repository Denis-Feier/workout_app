//
//  SubmitWorkoutSnap.swift
//  workout_app
//
//  Created by Denis Feier on 09.05.2021.
//

import Foundation
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore

struct SubmitWorkoutSnap {
    let workoutName: String
    let calories: Int
    let dateOfWorkout: String
    let duration: String
    let imageData: UIImage?
    
    private func uploadMedia(imageName: String, completion: @escaping (_ url: String?) -> Void) {

        if let user = Auth.auth().currentUser {
            
            let path = "images\\\(user.uid)\\\(imageName).jpeg"
            
            let storageRef = Storage.storage().reference()
                .child("images")
                .child("\(user.uid)")
                .child("\(imageName).jpeg")
            if let uploadData = imageData?.jpegData(compressionQuality: 0.5) {
                storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                    if error != nil {
                        print("error")
                        completion(nil)
                    } else {

                        storageRef.downloadURL(completion: { (url, error) in
                            print(url?.absoluteString)
                            completion(url?.absoluteString)
                        })

                    }
                }
            }
        }
    }
    
    func upload(error: @escaping (String) -> Void, success: @escaping () -> Void) {
        
        if let _ = imageData {
            uploadMedia(imageName: "\(Date.init().timeIntervalSince1970)") { url in
                if let link = url {
                    uploadToFirestore(url: link, error: error, success: success)
                } else {
                    error("Error Image upload, try again")
                }
            }
        } else {
            uploadToFirestore(url: "", error: error, success: success)
        }
        
    }
    
    private func uploadToFirestore(url: String?, error: @escaping (String) -> Void, success: @escaping () -> Void) {
        if let user = Auth.auth().currentUser {
            var ref: DocumentReference? = nil
            let db = Firestore.firestore()
            let path = "\(user.uid)"
            ref = db.collection(path).addDocument(data: [
                "workoutName": workoutName,
                "calories": calories,
                "dateOfWorkout": dateOfWorkout,
                "duration": duration,
                "imageUrl": url ?? ""
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                    error("Error adding workout")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                    success()
                }
            }
        }
    }
}
