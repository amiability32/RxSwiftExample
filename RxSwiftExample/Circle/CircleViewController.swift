//
//  CircleViewController.swift
//  RxSwiftExample
//
//  Created by sally on 2017. 11. 4..
//  Copyright © 2017년 sally. All rights reserved.
//

import ChameleonFramework
import UIKit
import RxSwift
import RxCocoa

class CircleViewController: UIViewController {

    var circleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }

    private func setup() {
        circleView = UIView(frame: CGRect(origin: view.center, size: CGSize(width: 100.0, height: 100.0)))
        circleView.layer.cornerRadius = circleView.frame.width / 2
        circleView.center = view.center
        circleView.backgroundColor = .green
        view.addSubview(circleView)
    }
    
}
