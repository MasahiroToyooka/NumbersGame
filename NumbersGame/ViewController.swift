//
//  ViewController.swift
//  NumbersGame
//
//  Created by 豊岡正紘 on 2019/08/05.
//  Copyright © 2019 Masahiro Toyooka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var answerLogTextView: UITextView!
    
    var trueNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputTextField.delegate = self
        answerLogTextView.isUserInteractionEnabled = false
        
        resetTrueNum()
        
    }
    

    @IBAction func decideButton(_ sender: Any) {
        
        answerLogTextView.text = answerLogTextView.text + "\(inputTextField.text ?? "")\n"
        answerLabel.text = inputTextField.text
        inputTextField.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func checkInputNum(num: Int) {
        
    }
    
    fileprivate func resetTrueNum() {
        trueNum = Int.random(in: 0...100)
    }
}

extension ViewController: UITextFieldDelegate {
    
    // 改行ボタンを押した時の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        answerLabel.text = textField.text
        
        // キーボードを隠す
        textField.resignFirstResponder()
        return true
    }
    
}

