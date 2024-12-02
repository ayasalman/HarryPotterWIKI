//
//  DetailsViewController.swift
//  HarryPotterWIKI
//
//  Created by Aya on 30/11/2024.
//

import UIKit

class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

class Line: UIView {

    var line = UIBezierPath()

    func drawLine() {
        // Move the line a little down by adding an offset (e.g., 20 points)
        let offset: CGFloat = 50
        line.move(to: CGPoint(x: 0, y: bounds.height / 2 + offset))
        line.addLine(to: CGPoint(x: bounds.width, y: bounds.height / 2 + offset))
        UIColor.white.setStroke()
        line.lineWidth = 1
        line.stroke()
    }

    override func draw(_ rect: CGRect) {
        drawLine()
    }
}
