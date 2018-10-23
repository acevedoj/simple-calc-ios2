//
//  ViewController.swift
//  simple-calc
//
//  Created by Juan Acevedo on 10/17/18.
//  Copyright © 2018 acevedoj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calculating: Bool = false;
    var previousNum: Double = 0;
    var currentNum: Double = 0;
    var operation: String = "";
    var counter: Int = 0;
    var args = [Double]();
    var historyString: String = "";

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBOutlet weak var displayFunction: UILabel!
    

    
    @IBAction func pressedNumber(_ sender: UIButton) {
        if (calculating) {
            displayFunction.text = "";
            calculating = false;
        }
        displayFunction.text = displayFunction.text! + sender.titleLabel!.text!;
        currentNum = Double(displayFunction.text!)!
        historyString += String(currentNum)

    }

    
    
    @IBAction func simpleMath(_ sender: UIButton) {
        if (displayFunction.text != "" && sender.titleLabel!.text! != "=") {
            calculating = true;
            previousNum = currentNum;
            args.append(previousNum)
            displayFunction.text = sender.titleLabel!.text!;
            operation = sender.titleLabel!.text!;
            historyString += " \(operation) "
        } else if (sender.titleLabel!.text == "=") {
            if (previousNum != 0 && currentNum != 0) {
                historyString += " = "
            }
            args.append(currentNum)
            if (operation == "+") {
                displayFunction.text = String(previousNum + currentNum);
                historyString += String(previousNum + currentNum);
            } else if (operation == "-") {
                displayFunction.text = String(previousNum - currentNum);
                historyString += String(previousNum - currentNum);
            } else if (operation == "/") {
                displayFunction.text = String(previousNum / currentNum);
                historyString += String(previousNum / currentNum);
            } else if (operation == "*") {
                displayFunction.text = String(previousNum * currentNum);
                historyString += String(previousNum * currentNum);
            } else if (operation == "%") {
                displayFunction.text = String(previousNum.truncatingRemainder(dividingBy: currentNum));
                if (displayFunction.text == "nan") {
                    historyString += " = \(String(previousNum.truncatingRemainder(dividingBy: currentNum)))|"
                } else {
                    historyString += String(previousNum.truncatingRemainder(dividingBy: currentNum));

                }
            } else if (operation == "!" && previousNum != 0 && currentNum != 0) {
                if (previousNum < 21) {
                    var factorial: UInt = 1;
                    var num = UInt(previousNum);
                    for _ in (1...num).reversed() {
                        factorial *= num;
                        num = num - 1;
                    }
                    displayFunction.text = String(Double(factorial))
                    historyString += String(Double(factorial));
                } else {
                    displayFunction.text = "Error number too large"
                    historyString += "Error number too large";
                }
            } else if (operation == "Count") {
                if (displayFunction.text == "Count") {
                    args.removeLast();
                }
                displayFunction.text = String(args.count);
                historyString += String(args.count);
            } else if (operation == "AVG") {
                if (displayFunction.text == "AVG") {
                    args.removeLast();
                }
                let sumOfArray = args.reduce(0, +)
                displayFunction.text = String(sumOfArray / Double(args.count))
                historyString += String(sumOfArray / Double(args.count))
            }
            if (previousNum != 0 && currentNum != 0) {
                historyString += "|"

            }
            operation = "";
            currentNum = 0;
            args = [];
            previousNum = 0;
            calculating = true;
        }
    }
    
    @IBAction func goToHistory(_ sender: UIButton) {
        performSegue(withIdentifier: "HistorySegue", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : HistoryViewController = segue.destination as! HistoryViewController
        
        let wordArray = historyString.components(separatedBy: "|")
        destVC.dataFromFirst = wordArray
    }
    
    
}

