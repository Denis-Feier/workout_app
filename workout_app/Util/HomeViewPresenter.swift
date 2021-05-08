//
//  HomeViewPresenter.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import Foundation
import UIKit

class HomeViewPresenter {
    
    static func getHomeVC() -> UIViewController {
        let tabbar = UITabBarController()
        
        let iconWidth = 35
        
        let iconHeight = 35
        
        let home = HomeVC()
                
        let homeIcon = resizedImage(name: "home-icon", for: CGSize(width: iconWidth, height: iconHeight))

        home.tabBarItem = UITabBarItem(title: "Home", image: homeIcon, tag: 0)
        
        let workout = WorkoutVC()
        
        let workoutIcon = resizedImage(name: "workout-icon", for: CGSize(width: iconWidth, height: iconHeight))
        
        workout.tabBarItem = UITabBarItem(title: "Workout", image: workoutIcon, tag: 1)
        
        tabbar.viewControllers = [home, workout]
        tabbar.selectedViewController = home
        
        return tabbar
    }
    
    private static func resizedImage(name: String, for size: CGSize) -> UIImage? {
        guard let image = UIImage(named: name) else {
            return nil
        }

        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
