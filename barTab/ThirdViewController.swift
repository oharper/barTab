//
//  ThirdViewController.swift
//  barTab
//
//  Created by Owen Harper on 27/01/2017.
//  Copyright © 2017 Owen Harper. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var rightTable: UITableView!
    @IBOutlet weak var leftTable: UITableView!
    
    var cell: UITableViewCell!
    @IBAction func savePressed(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    var drinksArray = ["Peroni", "Carling", "Fosters"]
    var currentOrder = [String]()
    var isInOrder: Bool = false
    var orderValue: String = ""
    var itemToRemoveIndex: Int = 0
    
    let cellIdentifier : String = "cell"
    
    var numberLeftTable: Int = 0
    var numberRightTable: Int = 0
    
    var toBeMoved: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        leftTable.delegate = self
        rightTable.delegate = self
        leftTable.dataSource = self
        rightTable.dataSource = self
        
        self.navigationItem.setHidesBackButton(false, animated: false)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView.tag == 1) {
            numberLeftTable = drinksArray.count
            return numberLeftTable
        }
        else if (tableView.tag == 2) {
            numberRightTable = currentOrder.count
            return numberRightTable
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as UITableViewCell
        cell.textLabel?.font = UIFont.systemFont(ofSize: 24)
        
        if (tableView.tag == 1) {
            cell.textLabel?.text = drinksArray[indexPath.row]
        }
        else if (tableView.tag == 2) {
            cell.textLabel?.text = currentOrder[indexPath.row]
        }
        return cell
    }
    
    func checkAlreadyInOrder(toBeMoved: String) -> Bool {
        for object in currentOrder {
            if object.range(of:toBeMoved) != nil {
                let isInOrder = true
                return isInOrder
            }
        }
        return isInOrder
    }
    
    func getAlreadyInOrder(toBeMoved: String) -> String {
        for object in currentOrder {
            if object.range(of:toBeMoved) != nil {
                let orderValue = object
                return orderValue
            }
        }
        return orderValue
    }
    
    func getAlreadyInOrderIndex(itemToRemove: String) -> Int {
        while currentOrder.contains(itemToRemove) {
            if let itemToRemoveIndex = currentOrder.index(of: itemToRemove) {
                print(itemToRemoveIndex)
                
                return itemToRemoveIndex
            }
        }
        return itemToRemoveIndex
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (tableView.tag == 1) {
            toBeMoved = drinksArray[indexPath.row]
            if checkAlreadyInOrder(toBeMoved: toBeMoved) {
                print("Already in order")
                //code here for if it is already in order
                let orderValue = getAlreadyInOrder(toBeMoved: toBeMoved)
                let index = orderValue.index(orderValue.endIndex, offsetBy: -2)
                let quantity = orderValue[index]
                let newQuantity = Int(String(quantity))! + 1
                
                let itemToRemoveIndex = getAlreadyInOrderIndex(itemToRemove: orderValue)
                currentOrder[itemToRemoveIndex] = toBeMoved + "(" + String(newQuantity) + ")"
                
                
//                currentOrder.append(toBeMoved + "(" + String(newQuantity) + ")")
                self.rightTable.reloadData()
            }
            else {
                print("Not in order")
                //code here for if it is not already in order
                currentOrder.append(toBeMoved+"(1)")
                self.rightTable.reloadData()
            }
        }
        else if (tableView.tag == 2) {
            
            let indexToBeMoved = currentOrder[indexPath.row].index(currentOrder[indexPath.row].endIndex, offsetBy: -3)
            toBeMoved = currentOrder[indexPath.row].substring(to: indexToBeMoved)
            let orderValue = getAlreadyInOrder(toBeMoved: toBeMoved)
            let index = orderValue.index(orderValue.endIndex, offsetBy: -2)
            let quantity = orderValue[index]
            let newQuantity = Int(String(quantity))! - 1
            
            let itemToRemoveIndex = getAlreadyInOrderIndex(itemToRemove: orderValue)
            
            
            if newQuantity > 0 {
            currentOrder[itemToRemoveIndex] = toBeMoved + "(" + String(newQuantity) + ")"
            } else {
                currentOrder.remove(at: indexPath.row)
            }
            self.rightTable.reloadData()
            
            
        }
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
