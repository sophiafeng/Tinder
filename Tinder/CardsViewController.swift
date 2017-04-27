//
//  CardsViewController
//  Tinder
//
//  Created by Sophia on 4/26/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var originalCenter: CGPoint?
    @IBOutlet var draggableImageView: DraggableImageView!
    
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        let imageView = sender.view as! DraggableImageView
        let translation = sender.translation(in: self.view)
        
        switch sender.state {
        case .began:
            originalCenter = imageView.center
            break
        case .changed:
            imageView.center = CGPoint(x: (originalCenter?.x)! + translation.x, y: (originalCenter?.y)!)
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

