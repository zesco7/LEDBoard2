//
//  BoardViewController.swift
//  LEDBoard2
//
//  Created by Mac Pro 15 on 2022/07/06.
//

import UIKit

class BoardViewController: UIViewController {

    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var resultLablel: UILabel!
    @IBOutlet weak var textColorButton: UIButton!
    
    @IBOutlet var buttonList: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designButton( sendButton, buttonTitle: "클릭", HightlightedTitle: "누르세요", bgColor: .orange)
        designButton( textColorButton, buttonTitle: "클릭2", HightlightedTitle: "누르세요2", bgColor: .yellow)
        designTextField()
    }
        
        
        /*
         let phoneNumber = "01012345678"
        let result = Int(phoneNumber)!
        print(result)

        1. 반복문
        let buttonArray : [UIButton] = [sendButton]
        for item in buttonArray {
            item.backgroundColor = .blue
            item.layer.cornerRadius = 2
        }
        2. 아웃렛컬렉션
        for item in buttonList {
            item.backgroundColor = .blue
            item.layer.cornerRadius = 2
        }
    }
         */
    func designTextField(){
        userTextField.placeholder = "내용을 작성해주세요"
                userTextField.text = "안녕하세요"
                userTextField.keyboardType = .emailAddress
    }
    
    // buttonOutletVariableName : 외부 매개변수, Argument Lable -> 언더바 사용해서 생략가능(와일드카드 식별자)
    // buttonName : 내부 매개변수, Parameter Name
    func designButton(_ buttonName: UIButton, buttonTitle: String, HightlightedTitle: String, bgColor: UIColor) {
        buttonName.setTitle(buttonTitle, for: .normal)
        buttonName.setTitle(HightlightedTitle, for: .highlighted)
        buttonName.backgroundColor = .yellow
        buttonName.layer.cornerRadius = 8
        buttonName.layer.borderColor = UIColor.black.cgColor
        buttonName.layer.borderWidth = 3
        buttonName.setTitleColor(.red, for: .normal)
        buttonName.setTitleColor(.blue, for: .highlighted)
    }
    
    @IBAction func sendButtonClicked(_ sender: UIButton) {
        
        resultLablel.text = userTextField.text
        
    }
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        //키보드 내리기
        view.endEditing(true)
    }
    
    @IBAction func exbutton1(_ sender: UIButton) {
        view.endEditing(true)
    }
    //연결관계를 다 끊어보고 any로 연결하기
}
