//
//  SecondViewController.swift
//  barTab
//
//  Created by Owen Harper on 25/01/2017.
//  Copyright © 2017 Owen Harper. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var errorIcon: UIImageView!
    var code = String();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let QRDate = code.substring(to:code.index(code.startIndex, offsetBy: 8))
        
        if QRDate == getDateTime() {
            let table = code.substring(from:code.index(code.endIndex, offsetBy: -2))
            self.title = "Table " + table
        } else {
            self.title = "Not a valid code"
            errorIcon.isHidden = false
            //code to show a error cross icon here
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getDateTime() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        let result = formatter.string(from: date)
        return result
    }
    
    
}
