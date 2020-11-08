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

    // 追加
    override func viewDidLoad() {
        super.viewDidLoad()

        Prefecture.allCases
            .enumerated()
            .map { offset, prefecture in
                let button = UIButton()
                button.setTitle(prefecture.name, for: .normal)
                button.setTitleColor(.blue, for: .normal)

                // 複数スクリーンサイズ対応のことを考えると固定座標でのレイアウトはバッドノウハウ
                // Auto Layoutを使うべき
                button.frame.size = CGSize(width:70, height:40)
                button.center.x = view.frame.width / 2
                button.center.y = view.safeAreaInsets.top + (CGFloat(offset) * button.frame.height + 50)

                let action: Selector
                switch prefecture {
                case .hokkaido:
                    action = #selector(tappedHokkaido(_:))
                case .kanagawa:
                    action = #selector(tappedKanagawa(_:))
                case .tokyo:
                    action = #selector(tappedTokyo(_:))
                case .saitama:
                    action = #selector(tappedSaitama(_:))
                }

                button.addTarget(self, action: action, for: .touchUpInside)

                return button
            }
            .forEach {
                view.addSubview($0)
            }
    }

    // 複数回呼ばれうるのでタイミングとして適切ではない
//    override func viewWillLayoutSubviews() {
//        // super.viewWillLayoutSubviews を呼んでない
//
//        //列挙型の数だけのボタン作成
//        for prefectrue in Prefecture.allCases{
//            let button = UIButton()
//            button.setTitle(prefectrue.name, for: .normal)
//            button.setTitleColor(.blue, for: .normal)
//
//            button.frame.size = CGSize(width:70, height:40)
//            button.center.x = view.frame.width / 2
//            button.center.y = view.safeAreaInsets.top + (CGFloat(prefectrue.num) * button.frame.height + 50)
//
//            switch prefectrue {
//            case .hokkaido:
//                button.addTarget(self, action: #selector(tappedHokkaido(_:)), for: .touchUpInside)
//            case .kanagawa:
//                button.addTarget(self, action: #selector(tappedKanagawa(_:)), for: .touchUpInside)
//            case .tokyo:
//                button.addTarget(self, action: #selector(tappedTokyo(_:)), for: .touchUpInside)
//            case .saitama:
//                button.addTarget(self, action: #selector(tappedSaitama(_:)), for: .touchUpInside)
//            }
//            view.addSubview(button)
//        }
//    }

    @objc private func tappedHokkaido(_ sender:UIButton){
        tappedPrefecture(prefecture: .hokkaido)
    }
    @objc private func tappedKanagawa(_ sender:UIButton){
        tappedPrefecture(prefecture: .kanagawa)
    }
    @objc private func tappedTokyo(_ sender:UIButton){
        tappedPrefecture(prefecture: .tokyo)
    }
    @objc private func tappedSaitama(_ sender:UIButton){
        tappedPrefecture(prefecture: .saitama)
    }

    // 追加
    private func tappedPrefecture(prefecture: Prefecture) {
        selectedPrefecture = prefecture.name
        performSegue(withIdentifier: "updateLabel",sender: nil)
    }

    // 削除
//    private func performSegue(){
//        performSegue(withIdentifier: "updateLabel",sender: nil)
//    }

}

//enum Prefecture:String, CaseIterable{
enum Prefecture: CaseIterable {

    // ローカライズ考慮のことを考えると良い方法ではない
//    case hokkaido = "北海道"
//    case kanagawa = "神奈川"
//    case tokyo = "東京"
//    case saitama = "埼玉"

    case hokkaido
    case kanagawa
    case tokyo
    case saitama

    // 追加
    var name: String {
        switch self {
        case .hokkaido: return "北海道"
        case .kanagawa: return "神奈川"
        case .tokyo: return "東京"
        case .saitama: return "埼玉"
        }
    }

    // レイアウト処理で必要になっただけの番号なのでenumでの定義はすべきではない
//    var num: Int{
//        switch self{
//        case .hokkaido:return 0
//        case .kanagawa:return 1
//        case .tokyo:return 2
//        case .saitama:return 3
//        }
//    }
}
