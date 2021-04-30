//
//  ViewControllerBase.swift
//  yumemi-ios
//
//  Created by kou yamamoto on 2021/04/30.
//

import UIKit
import Toaster

// ViewControllerの基底クラス
///
/// ViewControllerを作成する際に必ず継承するもの
/// ここに処理を記述する際は本当にここに書いた方がいいものなのかを考える

class ViewControllerBase: UIViewController {

    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var grayView: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// ViewBaseプロトコルを継承
extension ViewControllerBase: ViewBase {

    func showToast(message: String) {
        Toast(text: message, delay: 0, duration: 2.0).show()
    }

    func beginActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
    }

    func endActivityIndicator() {
        self.activityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
        self.grayView.removeFromSuperview()
    }
}
