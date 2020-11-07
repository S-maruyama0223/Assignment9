//
//  SecondViewController.swift
//  Assignment9
//
//  Created by Shotaro Maruyama on 2020/11/06.
//  
//

import UIKit

class SecondViewController: UIViewController {
    
    private(set) var selectedPrefecture:Prefecture?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        for prefectrue in Prefecture.allCases{
            let button = UIButton()
            button.setTitle(prefectrue.rawValue, for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.frame.size = CGSize(width:70, height:40)
            button.center.x = view.frame.width / 2
            button.center.y = view.safeAreaInsets.top + (CGFloat(prefectrue.num) * button.frame.height + 50)
            button.addTarget(self, action: #selector(selectPrerecture(_:)), for: .touchUpInside)
            view.addSubview(button)
        }
    }
    
    @objc func selectPrerecture(_ sender:UIButton){
        selectedPrefecture = Prefecture(rawValue:sender.currentTitle!)
        switch selectedPrefecture {
        case .hokkaido:
            performSegue(withIdentifier: "hokkaido", sender: nil)
        case .kanagawa:
            performSegue(withIdentifier: "kanagawa", sender: nil)
        case .tokyo:
            performSegue(withIdentifier: "tokyo", sender: nil)
        case .saitama:
            performSegue(withIdentifier: "saitama", sender: nil)
        case .none:
            print("did not select")
        }
    }
    
}

enum Prefecture:String, CaseIterable{
    case hokkaido = "北海道"
    case kanagawa = "神奈川"
    case tokyo = "東京"
    case saitama = "埼玉"
    
    
    var num: Int{
        switch self{
        case .hokkaido:return 0
        case .kanagawa:return 1
        case .tokyo:return 2
        case .saitama:return 3
        }
    }
}
