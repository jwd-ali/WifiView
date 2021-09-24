import UIKit

@IBDesignable
public final class WifiView: UIView {

  //MARK:- properties
  private enum Constants {
    static let lineWidth: CGFloat = 15.0
    static let frontColor = #colorLiteral(red: 0.270681262, green: 0.13513273, blue: 0.9266189933, alpha: 1)
    static let backColor = #colorLiteral(red: 0.7311470509, green: 0.7477237582, blue: 0.8476925492, alpha: 1)
    static let speed = 1.5
  }

  public enum SignalStrength: Int {
    case twoSignals
    case weak
  }

  public typealias completion = () -> Void

  // MARK: - Layers
  private lazy var circularLayerAFront = CAShapeLayerFactory.createShapeLayer(strokeColor: Constants.frontColor, lineWidth: Constants.lineWidth)

  private lazy var circularLayerABack = CAShapeLayerFactory.createShapeLayer(strokeColor: Constants.backColor, lineWidth: Constants.lineWidth)

  private lazy var circularLayerBFront = CAShapeLayerFactory.createShapeLayer(strokeColor: Constants.frontColor, lineWidth: Constants.lineWidth)

  private lazy var circularLayerBBack = CAShapeLayerFactory.createShapeLayer(strokeColor: Constants.backColor, lineWidth: Constants.lineWidth)

  private lazy var circularLayerCFront = CAShapeLayerFactory.createShapeLayer(strokeColor: Constants.frontColor, lineWidth: Constants.lineWidth)

  private lazy var circularLayerCBack = CAShapeLayerFactory.createShapeLayer(strokeColor: Constants.backColor, lineWidth: Constants.lineWidth)

  private lazy var allLayers = [circularLayerABack, circularLayerBBack, circularLayerCBack, circularLayerAFront, circularLayerBFront, circularLayerCFront]

  // MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }

  override public func layoutSubviews() {
    super.layoutSubviews()
    updatePaths()
  }
}

private extension WifiView {
  func commonInit() {
    allLayers.forEach(layer.addSublayer)
  }

  func updatePaths() {

    allLayers.forEach { $0.frame = bounds }

    let center = CGPoint(x: bounds.maxX / 2, y: bounds.maxY / 2)
    let maximumRadius =  min(bounds.maxX,bounds.maxY)/2 - (Constants.lineWidth / 2.0)
    let startAngleA = 225.deg2rad
    let endAngleA = 315.deg2rad

    let startAngleB = 227.deg2rad
    let endAngleB = 313.deg2rad

    let startAngleC = 229.deg2rad
    let endAngleC = 311.deg2rad

    circularLayerAFront.path = UIBezierPath(arcCenter: center, radius: maximumRadius, startAngle: startAngleA, endAngle: endAngleA, clockwise: true).cgPath
    circularLayerABack.path = circularLayerAFront.path

    circularLayerBFront.path = UIBezierPath(arcCenter: center, radius: maximumRadius*0.66, startAngle: startAngleB, endAngle: endAngleB, clockwise: true).cgPath
    circularLayerBBack.path = circularLayerBFront.path

    circularLayerCFront.path = UIBezierPath(arcCenter: center, radius: maximumRadius*0.33, startAngle: startAngleC, endAngle: endAngleC, clockwise: true).cgPath
    circularLayerCBack.path = circularLayerCFront.path
  }

  func strokeOutALayer() {
    circularLayerAFront.strokeAnimation(duration: Constants.speed)
    circularLayerABack.strokeAnimation(duration: Constants.speed)
  }

  func strokeOutBLayer() {
    circularLayerBFront.strokeAnimation(duration: Constants.speed)
    circularLayerBBack.strokeAnimation(duration: Constants.speed)
  }
}

// MARK:- Public functions
public extension WifiView {
  func startAnimating(signalStrength: SignalStrength, completion: completion? = nil) {
    startAnimating(completion: completion)
    switch signalStrength {
      case .twoSignals:
        strokeOutALayer()
      case .weak:
        strokeOutALayer()
        strokeOutBLayer()
    }
  }

  func startAnimating(repeatCount: Float = 0, completion: completion? = nil) {

    circularLayerAFront.animateRotateFrames(values: [0, 45.deg2rad, 47.deg2rad, -1*(360.deg2rad), -1*(400.deg2rad), -1*(360.deg2rad)], times: [0, 0.1, 0.15, 0.86, 0.93, 1], duration: Constants.speed, delay: Constants.speed/25, repeatCount: repeatCount, completion: completion)
    circularLayerBFront.animateRotateFrames(values: [0, 45.deg2rad, 47.deg2rad, -1*(360.deg2rad), -1*(400.deg2rad), -1*(360.deg2rad)], times: [0, 0.10, 0.13, 0.86, 0.93, 1], duration: Constants.speed, delay: Constants.speed/50, repeatCount: repeatCount)
    circularLayerCFront.animateRotateFrames(values: [0, 45.deg2rad, 47.deg2rad, -1*(360.deg2rad), -1*(400.deg2rad), -1*(360.deg2rad)], times: [0, 0.10, 0.11, 0.8, 0.93, 1], duration: Constants.speed, repeatCount: repeatCount)

    circularLayerABack.animateRotateFrames(values: [0, 45.deg2rad, 47.deg2rad, -1*(180.deg2rad),-1*(360.deg2rad), -1*(370.deg2rad), -1*(360.deg2rad)], times: [0, 0.1, 0.33, 0.7,0.9, 0.97, 1], duration: Constants.speed, delay: Constants.speed/15, repeatCount: repeatCount)
    circularLayerBBack.animateRotateFrames(values: [0, 45.deg2rad, 47.deg2rad, -1*(180.deg2rad), -1*(360.deg2rad), -1*(370.deg2rad), -1*(360.deg2rad)], times: [0, 0.1, 0.33,0.7, 0.9, 0.97, 1], duration: Constants.speed, delay: Constants.speed/15, repeatCount: repeatCount)
    circularLayerCBack.animateRotateFrames(values: [0, 45.deg2rad, 47.deg2rad, -1*(180.deg2rad),-1*(360.deg2rad), -1*(370.deg2rad), -1*(360.deg2rad)], times: [0, 0.1, 0.3,0.7, 0.9, 0.96, 1], duration: Constants.speed, delay: Constants.speed/20, repeatCount: repeatCount)
  }

  func startAnimating(repeatCount: Float, fallback signalStrength: SignalStrength, completion: completion? = nil) {
    self.startAnimating(repeatCount: repeatCount) { [weak self] in
      self?.startAnimating(signalStrength: signalStrength)
    }
  }

  func stopAnimation() {
    allLayers.forEach { $0.removeAllAnimations() }
  }

  func resetLayers() {
    stopAnimation()
    allLayers.forEach { $0.lineWidth = Constants.lineWidth }
    allLayers.forEach { $0.strokeEnd = 1 }

  }

}
