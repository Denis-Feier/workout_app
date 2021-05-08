//
//  UIImageExtension.swift
//  workout_app
//
//  Created by Denis Feier on 08.05.2021.
//

import Foundation
import UIKit

extension UIImage {
    
    static func resizedImage(name: String, for size: CGSize) -> UIImage? {
        guard let image = UIImage(named: name) else {
            return nil
        }

        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
}
