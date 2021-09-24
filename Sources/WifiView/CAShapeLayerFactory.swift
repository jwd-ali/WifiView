//
//  CAShapeLayerFactory.swift
//  WifiAnimation
//
//  Created by Jawad Ali on 24/09/2021.
//

import UIKit
public class CAShapeLayerFactory {

  public class func createShapeLayer<T: CAShapeLayer>(withFillColor fillColor: UIColor = .clear, strokeColor: UIColor, lineCap: CAShapeLayerLineCap = .round, lineWidth: CGFloat = 15) -> T {
    let shapeLayer = T()
    shapeLayer.fillColor = fillColor.cgColor
    shapeLayer.strokeColor = strokeColor.cgColor
    shapeLayer.lineCap = lineCap
    shapeLayer.lineWidth = lineWidth
    return shapeLayer
  }
}
