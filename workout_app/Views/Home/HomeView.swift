//
//  HomeView.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import UIKit

class HomeView: UIView {

    @IBOutlet var containerView: UIView!
    
    var tableView: UITableView = UITableView()

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
        
        containerView.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        
        tableView.register(UINib(nibName: "WorkoutCell", bundle: nil), forCellReuseIdentifier: "WorkoutCell")

    }
    
}
