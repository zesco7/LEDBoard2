//
//  LEDViewController.swift
//  LEDBoard2
//
//  Created by Mac Pro 15 on 2022/08/26.
//

import UIKit

class LEDViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textColorButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTextField.placeholder = "내용을 작성해주세요"
        userTextField.text = "안녕하세요"
        sendButton.setTitle("전송", for: .normal)
        sendButton.setTitle("빨리보내", for: .highlighted)
        sendButton.backgroundColor = .yellow
        sendButton.layer.cornerRadius = 8
        sendButton.layer.borderColor = UIColor.black.cgColor
        sendButton.layer.borderWidth = 3
        sendButton.setTitleColor(.red, for: .normal)
        sendButton.setTitleColor(.blue, for: .highlighted)

    }
    
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        resultLabel.text = "\(userTextField.text!) \(Int.random(in:1...10))"
    }
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
