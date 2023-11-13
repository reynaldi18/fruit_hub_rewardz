//
//  CALayer+Sketch.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import Foundation
import UIKit

extension CALayer {
    func setShadows(
        withColor color: UIColor = .black
        , withOpacity opacity: Float = 0.12
        , withPositionX positionX: CGFloat = 0
        , withPositionY positionY: CGFloat = 7
        , withBlur blur: CGFloat = 15
        , withSpread spread: CGFloat = 0) {
            
            self.shadowColor = color.cgColor
            self.shadowOpacity = opacity
            self.shadowOffset = CGSize(width: positionX, height: positionY)
            self.shadowRadius = blur / 2.0
            if spread == 0 {
                self.shadowPath = nil
            } else {
                let rect = bounds.insetBy(dx: spread, dy: spread)
                self.shadowPath = UIBezierPath(rect: rect).cgPath
            }
        }
}
