//
//  SecondViewController.swift
//  barTab
//
//  Created by Owen Harper on 25/01/2017.
//  Copyright © 2017 Owen Harper. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet var iconLabels: [UILabel]!
    @IBOutlet var iconImages: [UIButton]!
    @IBOutlet weak var errorIcon: UIImageView!
    var code = String();
    var table: String = ""
    var buttonPressed: String = ""
    
    @IBAction func chosenCategory(sender: AnyObject) {
    guard let button = sender as? UIButton else {
    return
    }
    
    switch button.tag {
    case 1:
    buttonPressed = "Wine"
    performSegue(withIdentifier: "showThird", sender: nil)
    case 2:
    buttonPressed = "Beer"
    performSegue(withIdentifier: "showThird", sender: nil)
    case 3:
    buttonPressed = "Spirits"
    performSegue(withIdentifier: "showThird", sender: nil)
    case 4:
    buttonPressed = "Soft Drinks"
    performSegue(withIdentifier: "showThird", sender: nil)
    case 5:
    buttonPressed = "Others"
    performSegue(withIdentifier: "showThird", sender: nil)
    return
    default: print("error")
    }
    }
    
    
    @IBAction func donePressed(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func retryPressed(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
//        var code = "31/01/17:01" // delete this!
        
        let QRDate = code.substring(to:code.index(code.startIndex, offsetBy: 8))
        
        if QRDate == getDateTime() {
            let table = code.substring(from:code.index(code.endIndex, offsetBy: -2))
            self.title = "Table " + table
            //Show icons and labels
            for image in iconImages {
                image.isHidden = false
            }
            for label in iconLabels {
                label.isHidden = false
            }
            retryButton.isHidden = true
            errorIcon.isHidden = true
        } else {
            
            //Hide icons and labels
            for label in iconLabels {
                label.isHidden = true
            }
            for image in iconImages {
                image.isHidden = true
            }
            self.title = "Not a valid code"
            errorIcon.isHidden = false
            //code to show a error cross icon here
            retryButton.isHidden = false
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showThird") {
            let view : ThirdViewController = segue.destination as! ThirdViewController;
            let table = code.substring(from:code.index(code.endIndex, offsetBy: -2))
            view.tableNumber = table
            view.category = buttonPressed
        }
    }
    
    
}
