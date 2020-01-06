//
//  ViewController.swift
//  ios-autotest
//
//  Created by yauheni prakapenka on 24.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var withoutArgumentLabel: UILabel!
    @IBOutlet weak var hiddenLabel: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttobThree: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let locationManager = CLLocationManager()
    private let textArray = ["Утренний рассвет", "Вечерний закат", "Дивный день"]
    private let imagesArray = [#imageLiteral(resourceName: "tumblr_ol6o615mfP1qa9gmgo10_500"), #imageLiteral(resourceName: "tumblr_ol6o615mfP1qa9gmgo1_500"), #imageLiteral(resourceName: "tumblr_ol6o615mfP1qa9gmgo6_500")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        addArgument()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        resultLabel.text = "\(sender.currentTitle ?? "") нажата"
        let buttons = [buttonOne, buttonTwo, buttobThree]
        for button in buttons {
            button?.backgroundColor = #colorLiteral(red: 0.0759813115, green: 0.6622361541, blue: 0.9625448585, alpha: 1)
        }
        sender.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(showHiddenLabel), userInfo: nil, repeats: false)
    }
    
    @objc func showHiddenLabel() {
        hiddenLabel.alpha = 1
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        resultLabel.text = "аАяЯaAzZ09!)=| отправлен"
    }
    
    @IBAction func coverInterfaceButtonTapped(_ sender: UIButton) {
        let customView = UIView()
        customView.frame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: 100)
        customView.backgroundColor = .red
        view.addSubview(customView)
    }
    
    private func addArgument() {
        if ProcessInfo.processInfo.arguments.contains("UITesting") {
            withoutArgumentLabel.text = "👩‍🔬💉 Режим ui тестирования"
            withoutArgumentLabel.textColor = .red
            activityIndicator.alpha = 1
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        textArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
        cell.label.text = textArray[indexPath.row]
        cell.label.textColor = .white
        
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8

        cell.imageView.image = imagesArray[indexPath.row]
        cell.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 50.0)
    }
}
