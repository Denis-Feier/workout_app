//
//  HomeViewPresenter.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import Foundation
import UIKit

class ViewPresenter {
    
    static var shared = ViewPresenter()
    
    private init() {}
    
    func getHomeVC() -> UIViewController {
        let tabbar = UITabBarController()
        
        let iconWidth = 35
        
        let iconHeight = 35
        
        let home = HomeVC()
                
        let homeIcon = UIImage.resizedImage(name: "workout-icon", for: CGSize(width: iconWidth, height: iconHeight))

        home.tabBarItem = UITabBarItem(title: "Home", image: homeIcon, tag: 0)
        
        let workout = WorkoutVC()
        
        let workoutIcon = UIImage.resizedImage(name: "plus-icon", for: CGSize(width: iconWidth, height: iconHeight))
        
        workout.tabBarItem = UITabBarItem(title: "Workout", image: workoutIcon, tag: 1)
        
        tabbar.viewControllers = [home, workout]
        tabbar.selectedViewController = home
        
        let exitIcon = UIImage.resizedImage(name: "exit-icon", for: CGSize(width: iconWidth, height: iconHeight))
        
        let logout = UIBarButtonItem(image: exitIcon, style: .plain, target: self, action: #selector(ViewPresenter.shared.logout))
        
        tabbar.navigationItem.rightBarButtonItem = logout
        
        return tabbar
    }
    
    @objc func logout() {
        
        AppSettings.shared.logout()
        
        let navigation = UINavigationController(rootViewController: LoginVC())
        
        guard let window = UIApplication.shared.windows.first else {
            return
        }

        window.rootViewController = navigation

        let options: UIView.AnimationOptions = .transitionCrossDissolve

        let duration: TimeInterval = 0.3

        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:
        { completed in
            
        })
    }
    
}
