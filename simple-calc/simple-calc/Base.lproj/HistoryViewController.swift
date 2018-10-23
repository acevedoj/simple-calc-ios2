//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by Juan Acevedo on 10/22/18.
//  Copyright © 2018 acevedoj. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView(frame: view.bounds)
        view.addSubview(scrollView)
        
    }
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
