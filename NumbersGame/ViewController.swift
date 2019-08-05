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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputTextField.delegate = self
        answerLogTextView.isUserInteractionEnabled = false
    }

    @IBAction func decideButton(_ sender: Any) {
        
        answerLabel.text = inputTextField.text
        inputTextField.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let inputTextField = inputTextField {
            answerLabel.text = inputTextField.text
        } else {
            
        }
        self.view.endEditing(true)
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

