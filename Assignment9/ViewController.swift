//
//  ViewController.swift
//  Assignment9
//
//  Created by Shotaro Maruyama on 2020/11/06.
//  
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var prefectureLabel: UILabel!
    
    @IBAction func updateLabel(segue:UIStoryboardSegue){
        let secondVC = segue.source as! SecondViewController
        self.prefectureLabel.text = secondVC.selectedPrefecture
    }
    
    @IBAction func exitCancel(segue:UIStoryboardSegue){}
}

