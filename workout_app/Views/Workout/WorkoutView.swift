//
//  WorkoutView.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import UIKit

class WorkoutView: UIView {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var workoutName: UITextField!
    @IBOutlet weak var burnedoutCalories: UITextField!
    @IBOutlet weak var dateOfWorkoutPicker: UIDatePicker!
    @IBOutlet weak var durationOfWorkout: UIDatePicker!
    @IBOutlet weak var pickPictureBtn: RoundedButton!
    @IBOutlet weak var submitBtn: RoundedButton!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spacer: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var delegate: WorkoutProtocol?
    
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
        hideImageContainer()
        burnedoutCalories.keyboardType = .numberPad
        dateOfWorkoutPicker.preferredDatePickerStyle = .wheels
        durationOfWorkout.preferredDatePickerStyle = .wheels
        setupBtns()
        
        dateOfWorkoutPicker.layer.borderColor = UIColor.black.cgColor
        dateOfWorkoutPicker.layer.borderWidth = 1
        dateOfWorkoutPicker.layer.cornerRadius = 12
        durationOfWorkout.layer.borderColor = UIColor.black.cgColor
        durationOfWorkout.layer.borderWidth = 1
        durationOfWorkout.layer.cornerRadius = 12
        
        scrollView.isDirectionalLockEnabled = true
        
        delegate?.setTextFieldsDelegate(fields: [burnedoutCalories])
    }
    
    func showImageContainer() {
        imageContainer.isHidden = false
    }
    
    func hideImageContainer() {
        imageContainer.isHidden = true
    }

    func setSpacerHeight(height: CGFloat) {
        spacer.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setImage(image: UIImage) {
        showImageContainer()
        imageView.image = image
    }
    
    func setupBtns() {
        submitBtn.addTarget(self, action: #selector(submit), for: .touchUpInside)
        pickPictureBtn.addTarget(self, action: #selector(openPicker), for: .touchUpInside)
    }
    
    @objc func openPicker() {
        delegate?.openSelector(completion: setImage(image:))
    }
    
    @objc func submit() {
        
        prepareData()
        
    }
    
    func prepareData() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let workoutText = workoutName.text ?? ""
        
        let workoutName = workoutText.isEmpty ? dateFormatter.string(from: Date.init()) : workoutText
        
        let caloriesText = burnedoutCalories.text ?? ""
        
        let calories = Int(caloriesText) ?? 0
        
        let dateOfWorkout = dateFormatter.string(from: dateOfWorkoutPicker.date)
        
        let duration = timeFormatter.string(from: durationOfWorkout.date)
        
        
        let workout = SubmitWorkoutSnap(workoutName: workoutName, calories: calories, dateOfWorkout: dateOfWorkout, duration: duration, imageData: imageView.image)
        
        // Delegate Code Here
        
        delegate?.uploadToFirebase(workout: workout)
        
    }
    
}
