//
//  ViewController.swift
//  CGAffineTransformSample
//
//  Created by katoj on 2017/04/22.
//  Copyright © 2017年 jun.kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targetView: UIView!
    @IBOutlet weak var frameLabel: UILabel!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        outputFrame()
    }

    @IBAction func didTapTranslateButton(_ sender: Any) {
        // 縦横に100pt移動
        targetView.transform = targetView.transform.translatedBy(x: 100, y: 100)
        outputFrame()
    }

    @IBAction func didTapScaleButton(_ sender: Any) {
        // x, y方向に2倍
        targetView.transform = targetView.transform.scaledBy(x: 2.0, y: 2.0)
        outputFrame()
    }

    @IBAction func didTapRotateButton(_ sender: Any) {
        // 45度回転
        targetView.transform = targetView.transform.rotated(by: 45 * .pi / 180)
        outputFrame()

        let view = UIView(frame: targetView.frame)
        view.backgroundColor = .red
        self.view.addSubview(view)
        self.view.bringSubview(toFront: targetView)
    }

    @IBAction func didTapResetButton(_ sender: Any) {
        // 初期化
        targetView.transform = .identity
        outputFrame()
    }

    private func outputFrame() {
        frameLabel.text = String(format: "(%.1f, %.1f, %.1f, %.1f)",
                                 arguments: [targetView.frame.origin.x,
                                             targetView.frame.origin.y,
                                             targetView.frame.width,
                                             targetView.frame.height])
    }
}
