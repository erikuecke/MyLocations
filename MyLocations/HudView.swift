//
//  HudView.swift
//  MyLocations
//
//  Created by Erik Uecke on 8/15/17.
//  Copyright © 2017 Erik Uecke. All rights reserved.
//

import Foundation
import UIKit
class HudView: UIView {
    
    var text = ""
    class func hud(inView view: UIView, animated: Bool) -> HudView {
        let hudView = HudView(frame: view.bounds)
        hudView.isOpaque = false
        view.addSubview(hudView)
        view.isUserInteractionEnabled = false
        hudView.show(animated: animated)
        return hudView
    }
    
    override func draw(_ rect: CGRect) {
        let boxWidth: CGFloat = 96
        let boxHeight: CGFloat = 96
        let boxRect = CGRect(
            x: round((bounds.size.width - boxWidth) / 2),
            y: round((bounds.size.height - boxHeight) / 2),
            width: boxWidth,
            height: boxHeight)
        let roundedRect = UIBezierPath(roundedRect: boxRect, cornerRadius: 10)
        UIColor(white: 0.3, alpha: 0.8).setFill()
        roundedRect.fill()
        
        
        // Add checkmark
        if let image = UIImage(named: "Checkmark") {
            let imagePoint = CGPoint( x: center.x - round(image.size.width / 2),
                                      y: center.y - round(image.size.height / 2) - boxHeight / 8)
            image.draw(at: imagePoint)
        }
        
        // Add Text
        let attribs = [ NSFontAttributeName: UIFont.systemFont(ofSize: 16), NSForegroundColorAttributeName: UIColor.white ]
        let textSize = text.size(attributes: attribs)
        let textPoint = CGPoint( x: center.x - round(textSize.width / 2),
                                 y: center.y - round(textSize.height / 2) + boxHeight / 4)
        text.draw(at: textPoint, withAttributes: attribs)
        

    }
    
    // Show Method
    func show(animated: Bool) {
        if animated {
            // 1
        
            alpha = 0
            transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            // 2 
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
                self.alpha = 1
                self.transform = CGAffineTransform.identity
            },
                           completion: nil)
            
        }
    }
            
    
}

