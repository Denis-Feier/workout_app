//
//  WorkoutVC.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import UIKit

class WorkoutVC: UIViewController {

//    lazy var setImageHandler: ((UIImage) -> Void)? = nil
    
    var workoutView = WorkoutView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let workout = WorkoutView()
        workoutView.delegate = self
        addView(workoutView)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func showSuccess() {
        showAlert(message: "Workout added!")
    }
    
    func showError(message: String) {
        showAlert(message: message)
    }
    
}

extension WorkoutVC: WorkoutProtocol {
    func uploadToFirebase(workout: SubmitWorkoutSnap) {
        let spinner = SpinnerViewController.createSpinnerView(vc: self)
        
        workout.upload { [weak self] errorMessage in
            SpinnerViewController.dismissSpinnerView(spinner: spinner)
            self?.showError(message: errorMessage)
        } success: { [weak self] in
            SpinnerViewController.dismissSpinnerView(spinner: spinner)
            self?.showSuccess()
        }

    }
    
    func openSelector(completion: ((UIImage) -> Void)? = nil) {
        
//        setImageHandler = completion
        
        let alert = UIAlertController(title: "Select Source", message: nil, preferredStyle: .actionSheet)
        let actionCamera = UIAlertAction(title: "Open Camera", style: .default) { _ in
            self.openPicker(sourceType: .camera)
        }
        
        let actionGallery = UIAlertAction(title: "Open Gallery", style: .default) { _ in
            self.openPicker(sourceType: .photoLibrary)
        }
        
        alert.addAction(actionCamera)
        
        alert.addAction(actionGallery)
        
        present(alert, animated: true, completion: nil)

    }
    
    func setTextFieldsDelegate(fields: [UITextField]) {
        for field in fields {
            field.delegate = self
        }
    }
    
}

extension WorkoutVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("LOG: No image found")
            return
        }
        
        workoutView.setImage(image: image)
    }
    
    func openPicker(sourceType: UIImagePickerController.SourceType) {
        
        if sourceType == .camera && !UIImagePickerController.isSourceTypeAvailable(.camera) {
            openPicker(sourceType: .photoLibrary)
        } else {
            let vc = UIImagePickerController()
            vc.sourceType = sourceType
            vc.allowsEditing = true
            vc.delegate = self
            present(vc, animated: true)
        }
        
    }
}

extension WorkoutVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.keyboardType == .numberPad {
            return string.range(of: "^\\d*$", options: .regularExpression) != nil
        }
        
        return true
    }
    
}
