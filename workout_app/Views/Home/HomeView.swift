//
//  HomeView.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import UIKit

class HomeView: UIView {

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
        Bundle.main.loadNibNamed("HomeView", owner: self, options: nil)
        addSubviewWithContraints(containerView)
    }
    
}
