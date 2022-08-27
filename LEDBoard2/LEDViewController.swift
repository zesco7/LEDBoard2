//
//  LEDViewController.swift
//  LEDBoard2
//
//  Created by Mac Pro 15 on 2022/08/26.
//

import UIKit

/*중요포인트
 -. 객체별 속성적용함수 따로 만들어주기.(designTextField, buttonAttribute 처럼)
 -. 매개변수(parameter)사용원리 이해하기.(매개변수 사용해서 객체별로 속성 적용할 수 있게 만들기.(레벨상관없이 매개변수로 적용할 수 있음))
 -. 공통속성 적용하기 2가지: OutletCollection, 배열
 -. 텍스트필드에서 return누르면 키보드 내리는 방법 2가지(action사용(DidEndOnExit), textFieldShouldReturn함수사용(UITextFieldDelegate))
 */

/*질문
 -. View isHidden기능 구현 방법(어떤걸 구현해야하는지 과제내용을 이해 못함)
 */

class LEDViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textColorButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var buttonList: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.backgroundColor = .clear
        resultLabel.numberOfLines = 0
        
        designTextField()
        buttonAttribute(sendButton, buttonTitle: "전송", hilightedButtonTitle: "빨리보내", buttonBackgroundColor: .yellow)
        buttonAttribute(textColorButton, buttonTitle: "글자색", hilightedButtonTitle: "변해라", buttonBackgroundColor: .blue)
        //userTextField.delegate = self //텍스트필드에서 return누르면 키보드 내리기2. : delegate연결
    }
    
    //객체별 속성적용함수 따로 만들어주기.(designTextField, buttonAttribute 처럼)
    func designTextField() {
        userTextField.placeholder = "내용을 작성해주세요"
        userTextField.text = "안녕하세요"
        userTextField.borderStyle = .none
    }
    
    //매개변수(parameter)사용원리 이해하기.
    //외부매개변수(argument label), 내부매개변수(parameter name) 나눠서 사용 가능(외부매개변수는 와일드카드식별자(언더바)로 생략가능)
    func buttonAttribute(_ buttonName: UIButton, buttonTitle: String, hilightedButtonTitle: String, buttonBackgroundColor bgColor: UIColor) {
        
        //공통속성 적용하기: OutletCollection(for-in 사용)
        for item in buttonList {
            item.backgroundColor = .black
            item.setTitleColor(.green, for: .normal)
        }
        
        //공통속성 적용하기: 배열(for-in 사용)
        /*
         let buttonArray : [UIButton] = [sendButton, textColorButton]
         for item in buttonArray {
         item.backgroundColor = .blue
         item.layer.cornerRadius = 2
         */
        
        //매개변수 사용해서 객체별로 속성 적용할 수 있게 만들기.(레벨상관없이 매개변수로 적용할 수 있음)
        buttonName.setTitle(buttonTitle, for: .normal)
        buttonName.setTitle(hilightedButtonTitle, for: .highlighted)
        buttonName.backgroundColor = bgColor
        buttonName.layer.cornerRadius = 8
        buttonName.layer.borderColor = UIColor.black.cgColor
        buttonName.layer.borderWidth = 3
        buttonName.setTitleColor(.green, for: .normal)
        buttonName.setTitleColor(.white, for: .highlighted)
    }
    
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        resultLabel.text = "\(userTextField.text!) \(Int.random(in:1...10))"
    }
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //텍스트필드에서 return누르면 키보드 내리기1. action사용(DidEndOnExit)
    @IBAction func keyboardDismiss(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    //텍스트필드에서 return누르면 키보드 내리기2. textFieldShouldReturn함수사용(UITextFieldDelegate)
    /*
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     view.endEditing(true)
     return false
     }
     */
}
