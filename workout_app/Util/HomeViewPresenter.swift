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
        
        let home = HomeVC()
        tabbar.viewControllers = [home]
        tabbar.selectedViewController = home
        
        return tabbar
    }
}
