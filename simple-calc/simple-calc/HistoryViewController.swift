//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by Juan Acevedo on 10/22/18.
//  Copyright © 2018 acevedoj. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var dataFromFirst = [String]()

    @IBOutlet weak var scrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var yPosition: CGFloat = 50
        var uiView = UIView()
        uiView.isUserInteractionEnabled = true;
        for i in (0...dataFromFirst.count - 1).reversed() {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: yPosition))
            label.text = dataFromFirst[i]
            label.contentMode = .scaleToFill
            label.numberOfLines = 0
            yPosition += 70
            uiView.addSubview(label)
            scrollview.contentSize = CGSize(width: scrollview.contentSize.width, height: UIScreen.main.bounds.height * 2)

        }
        scrollview.addSubview(uiView)
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
