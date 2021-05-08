//
//  RoundedButton.swift
//  workout_app
//
//  Created by Denis Feier on 09.05.2021.
//

import UIKit

class RoundedButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    func configureView() {
        layer.cornerRadius = 8
    }
    
}
