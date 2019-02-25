//
//  ViewController.swift
//  CALayerSample
//
//  Created by maeda.tasuku on 2019/02/25.
//  Copyright © 2019 maeda.tasuku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: UIView!
    
    var canvasLayer: CALayer {
        return canvasView.layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addLayerButtonTapped() {
        //for _ in 0 ..< 100 {
            addRandomColoredLayer()
        //}
    }
    
    func addRandomColoredLayer() {
        let layerSize = CGSize(width: 100, height: 100)
        let coloredLayer = createColoredLayer(width: layerSize.width, height: layerSize.height)
        let maxX: Float = Float(canvasView.frame.width - layerSize.width)
        let randomX = Float.random(in: 0 ... maxX)
        let maxY: Float = Float(canvasView.frame.height - layerSize.height)
        let randomY = Float.random(in: 0 ... maxY)
        coloredLayer.position = CGPoint(x: CGFloat(randomX), y: CGFloat(randomY))
        canvasLayer.addSublayer(coloredLayer)
    }
    
    func generateRandomColor() -> UIColor {
        let hue = Float.random(in: 0 ... 1.0)
        let saturation = Float.random(in: 0 ... 1.0)
        let brightness = Float.random(in: 0.5 ... 1.0)
        return UIColor(hue: CGFloat(hue),
                       saturation: CGFloat(saturation),
                       brightness: CGFloat(brightness),
                       alpha: 0.25)
    }
    
    func createColoredLayer(width: CGFloat = 50.0, height: CGFloat = 50.0) -> CALayer {
        let newLayer = CALayer()
        newLayer.backgroundColor = generateRandomColor().cgColor
        newLayer.anchorPoint = CGPoint(x: 0, y: 0)
        newLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        return newLayer
    }
}

