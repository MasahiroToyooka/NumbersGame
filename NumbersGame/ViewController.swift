//
//  ViewController.swift
//  NumbersGame
//
//  Created by 豊岡正紘 on 2019/08/05.
//  Copyright © 2019 Masahiro Toyooka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// 答えた数字を表示させるラベル
    @IBOutlet weak var answerLabel: UILabel!
    /// 答えを入力するテキストフィールド
    @IBOutlet weak var inputTextField: UITextField!
    /// 過去に答えた数字を表示させるテキストフィールド
    @IBOutlet weak var answerLogTextView: UITextView!
    
    
    /// 正解の数を入れる変数
    var trueNum: Int = 0
    
    /// 解答した回数を入れる変数
    var numerOfTimesAnswered: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // answerLogTextViewを触れないようにする
        answerLogTextView.isUserInteractionEnabled = false
        
        // numerOfTimesAnsweredに入れる値を決める関数
        resetTrueNum()
    }
    
    // 画面を触ったときに呼ばれるやつ
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // キーボードを閉じる処理
        self.view.endEditing(true)
    }
    
    // 決定ボタンが押された時の処理
    @IBAction func decideButton(_ sender: Any) {
        
        // キーボードを閉じる処理
        inputTextField.endEditing(true)
        
        guard let answerText = inputTextField.text else { return }
        
        guard let answerNum = Int(answerText) else { return }
        
        checkInputNum(yourAnswer: answerNum)
    }
    
    // 入力された値に応じて各々処理を呼び出す関数
    func checkInputNum(yourAnswer: Int) {
        
        // 数の正誤チェック
        if yourAnswer == trueNum {
            // 正解の場合
            
            // 答えた回数を更新
            numerOfTimesAnswered += 1
            
            // answerLogTextViewの内容を更新
            setupLogMessage(yourAnswer: yourAnswer)

            // アラートの表示
            showAllert(title: "正解", message: "\(numerOfTimesAnswered)回目で正解しました？！\n答えをリセットします")
            
            
            // クイズの初期化
            resetTrueNum()
            numerOfTimesAnswered   = 0
            answerLabel.text       = "???"
            inputTextField.text    = ""
            answerLogTextView.text = ""
        } else {
            // 不正解の場合
            
            // 答えが1〜100以外の場合
            if yourAnswer > 100 || yourAnswer < 1{
                // 答えた回数を更新
                numerOfTimesAnswered += 1
                
                // answerLabelの値を反映
                answerLabel.text = String(yourAnswer)
                
                // answerLogTextViewの内容を更新
                setupLogMessage(yourAnswer: yourAnswer)
                
                // アラートを表示
                showAllert(title: "エラー", message: "1~100の数字を入れてください")
                
            // 答えが正しい答えより高い場合
            } else if yourAnswer > trueNum {
                // 答えた回数を更新
                numerOfTimesAnswered += 1
                
                // answerLabelの値を反映
                answerLabel.text = String(yourAnswer)
                
                // answerLogTextViewの内容を更新
                setupLogMessage(yourAnswer: yourAnswer)
                
                // アラートを表示
                showAllert(title: nil, message: "答えは\(yourAnswer)より下です")
            } else {
                
            // 答えが正しい答えより低い場合
                
                // 答えた回数を更新
                numerOfTimesAnswered += 1
                
                // answerLabelの値を反映
                answerLabel.text = String(yourAnswer)
                
                // answerLogTextViewの内容を更新
                setupLogMessage(yourAnswer: yourAnswer)
                
                // アラートを表示
                showAllert(title: nil, message: "答えは\(yourAnswer)より上です")
            }
        }
    }
    
    // answerLogTextViewの表示内容を作る関数
    fileprivate func setupLogMessage(yourAnswer: Int) {

        // 答えが正解の数より高いか低いかを調べる
        if yourAnswer > trueNum {
            // 低い場合
            answerLogTextView.text = answerLogTextView.text + "[\(numerOfTimesAnswered)回目]答えは\(yourAnswer)より下です\n"
        } else {
            // 高い場合
            answerLogTextView.text = answerLogTextView.text +  "[\(numerOfTimesAnswered)回目]答えは\(yourAnswer)より上ですです\n"
        }
    }
    
    // 問題の数をランダムに生成する関数
    fileprivate func resetTrueNum() {
        trueNum = Int.random(in: 1...100)
    }
    
    // アラートを表示するための関数
    fileprivate func showAllert(title: String?, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        // OKアクションの追加
        alert.addAction(okAction)
        
        // アラートを表示させる
        present(alert, animated: true, completion: nil)
    }
}

