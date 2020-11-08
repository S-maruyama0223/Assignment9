//
//  SecondViewController.swift
//  Assignment9
//
//  Created by Shotaro Maruyama on 2020/11/06.
//  
//

import UIKit

class SecondViewController: UIViewController {
    
    private(set) var selectedPrefecture:String?
    
    override func viewWillLayoutSubviews() {
        //列挙型の数だけのボタン作成
        for prefectrue in Prefecture.allCases{
            let button = UIButton()
            button.setTitle(prefectrue.rawValue, for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.frame.size = CGSize(width:70, height:40)
            button.center.x = view.frame.width / 2
            button.center.y = view.safeAreaInsets.top + (CGFloat(prefectrue.num) * button.frame.height + 50)
            switch prefectrue {
            case .hokkaido:
                button.addTarget(self, action: #selector(tappedHokkaido(_:)), for: .touchUpInside)
            case .kanagawa:
                button.addTarget(self, action: #selector(tappedKanagawa(_:)), for: .touchUpInside)
            case .tokyo:
                button.addTarget(self, action: #selector(tappedTokyo(_:)), for: .touchUpInside)
            case .saitama:
                button.addTarget(self, action: #selector(tappedSaitama(_:)), for: .touchUpInside)
            }
            view.addSubview(button)
        }
    }
    
    @objc private func tappedHokkaido(_ sender:UIButton){
        self.selectedPrefecture = Prefecture.hokkaido.rawValue
        performSegue()
    }
    @objc private func tappedKanagawa(_ sender:UIButton){
        self.selectedPrefecture = Prefecture.kanagawa.rawValue
        performSegue()
    }
    @objc private func tappedTokyo(_ sender:UIButton){
        self.selectedPrefecture = Prefecture.tokyo.rawValue
        performSegue()
    }
    @objc private func tappedSaitama(_ sender:UIButton){
        self.selectedPrefecture = Prefecture.saitama.rawValue
        performSegue()
    }
    
    private func performSegue(){
        performSegue(withIdentifier: "updateLabel",sender: nil)
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
