//
//  ViewController.swift
//  Assignment9
//
//  Created by Shotaro Maruyama on 2020/11/06.
//  
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var prefectureLabel: UILabel!
    
    @IBAction func updateToHokkaido(segue:UIStoryboardSegue){
        self.prefectureLabel.text = Prefecture.hokkaido.rawValue
    }
    
    @IBAction func updateToKanagawa(segue:UIStoryboardSegue){
        self.prefectureLabel.text = Prefecture.kanagawa.rawValue
    }
    
    @IBAction func updateToTokyo(segue:UIStoryboardSegue){
        self.prefectureLabel.text = Prefecture.tokyo.rawValue
    }
    
    @IBAction func updateToSaitama(segue:UIStoryboardSegue){
        self.prefectureLabel.text = Prefecture.saitama.rawValue
    }
    
    @IBAction func exitCancel(segue:UIStoryboardSegue){
    }
    
}

