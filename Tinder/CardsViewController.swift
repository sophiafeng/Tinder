//
//  CardsViewController
//  Tinder
//
//  Created by Sophia on 4/26/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

class CardsViewController: UIViewController {

    var originalCenter: CGPoint?
    var originalDegree: CGFloat?
    @IBOutlet var draggableImageView: DraggableImageView!
    
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        let imageView = sender.view as! DraggableImageView
        let translation = sender.translation(in: self.view)
        let location = sender.location(in: self.view)
        
        switch sender.state {
        case .began:
            originalCenter = imageView.center
            originalDegree = (originalCenter?.x)!
            break
        case .changed:
            imageView.center = CGPoint(x: (originalCenter?.x)! + translation.x, y: (originalCenter?.y)!)
            let angle = Double(translation.x / 20).degreesToRadians
            if (location.y > imageView.center.y) {
                imageView.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
            } else {
                imageView.transform = CGAffineTransform(rotationAngle: CGFloat(-angle))
            }
            

            break
        case .ended:
            break
        default:
            break
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        draggableImageView.image = #imageLiteral(resourceName: "ryan")
        
        view.addSubview(draggableImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

