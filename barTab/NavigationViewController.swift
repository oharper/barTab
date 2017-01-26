//
//  NavigationViewController.swift
//  barTab
//
//  Created by Owen Harper on 26/01/2017.
//  Copyright © 2017 Owen Harper. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//Methods to force landscapeRight
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations:UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscapeRight
    }
//End of methods to force landscapeRight
    
}
