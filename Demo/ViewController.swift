//
//  ViewController.swift
//  Demo
//
//  Created by Jawad Ali on 24/09/2021.
//

import UIKit
import WifiView
final class ViewController: UIViewController {

  @IBOutlet private weak var wifiView: WifiView!
  private var selectedIndex = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func segmentTapped(_ sender: UISegmentedControl) {
    selectedIndex = sender.selectedSegmentIndex
    wifiView.resetLayers()
  }

  @IBAction private func startAnimation(_ sender: UIButton) {
    switch selectedIndex {
      case 0:
        wifiView.startAnimating()
      case 1:
        wifiView.startAnimating(repeatCount: .infinity)
      case 2:
        wifiView.startAnimating(repeatCount: 2, fallback: .twoSignals)
      case 3:
        wifiView.startAnimating(repeatCount: 2, fallback: .weak)
      default:
        assertionFailure("Not implemented cases above 3")
    }
  }

  @IBAction private func stopAnimation(_ sender: UIButton) {
    wifiView.stopAnimation()
  }
}

