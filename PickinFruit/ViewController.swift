//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        self.fruitPicker.delegate = self
        self.fruitPicker.dataSource = self
    }
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        for _ in 0...10_000 {
            let randomRow = Int(arc4random_uniform(UInt32(fruitsArray.count)))
            let randomComponent = Int(arc4random_uniform(UInt32(self.numberOfComponents(in: self.fruitPicker))))
            self.fruitPicker.selectRow(randomRow, inComponent: randomComponent, animated: true)
        }
        
        self.resultLabel.text = self.fruitPicker.selectedRow(inComponent: 0) == self.fruitPicker.selectedRow(inComponent: 1) && self.fruitPicker.selectedRow(inComponent: 1) == self.fruitPicker.selectedRow(inComponent: 2) ? "WINNER!" : "TRY AGAIN"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.fruitsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row]
    }
    
    

}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.white.cgColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



