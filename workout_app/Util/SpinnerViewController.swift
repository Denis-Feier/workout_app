//
//  SpinnerViewController.swift
//  workout_app
//
//  Created by Denis Feier on 09.05.2021.
//

import UIKit

class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        spinner.color = .white

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    static func createSpinnerView(vc: UIViewController) -> SpinnerViewController {
        let child = SpinnerViewController()
        
        vc.addChild(child)
        child.view.frame = vc.view.frame
        vc.view.addSubview(child.view)
        child.didMove(toParent: vc)
        
        return child
    }
    
    static func dismissSpinnerView(spinner: SpinnerViewController?) {
        
        guard let child = spinner else {
            return
        }
        
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    
}
