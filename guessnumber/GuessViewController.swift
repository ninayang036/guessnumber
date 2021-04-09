//
//  GuessViewController.swift
//  guessnumber
//
//  Created by Yang Nina on 2021/4/8.
//

import UIKit

class GuessViewController: UIViewController {

    @IBOutlet weak var goBtn: UIButton!
    @IBOutlet weak var bombBtn: UIButton!
    @IBOutlet weak var guessBtn: UIButton!
    @IBOutlet weak var inputNum: UITextField!
    @IBOutlet weak var moodImg: UIImageView!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var speak: UILabel!
    
    var randomNum = Int.random(in: 1...50)
    var minNum:Int = 0
    var maxNum:Int = 50
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reset()
    }
    @IBAction func start(_ sender: UIButton) {
        goBtn.isHidden = true
        guessBtn.isHidden = false
        inputNum.isEnabled = true
        inputNum.placeholder = "0"
    }
    @IBAction func guess(_ sender: UIButton) {
        moodImg.frame.origin.y = CGFloat(390)
        if inputNum.text == ""{
            moodImg.image = UIImage(named: "sleep")
            speak.text = "快要睡著囉～～"
        }
        else if Int(inputNum.text!)! >= maxNum || Int(inputNum.text!)! <= minNum{
            moodImg.image = UIImage(named: "angry")
            speak.text = "超過範圍了!!!"
        }
        else if Int(inputNum.text!)! > randomNum{
            maxNum = Int(inputNum.text!)!
            moodImg.image = UIImage(named: "happy")
            speak.text = "數字大了點!!"
        }
        else if Int(inputNum.text!)! < randomNum{
            minNum = Int(inputNum.text!)!
            moodImg.image = UIImage(named: "dizzy")
            speak.text = "數字有點小＠＠"
        }
        else if Int(inputNum.text!)! == randomNum{
            moodImg.image = UIImage(named: "surprise")
            bombBtn.isHidden = false
            guessBtn.isHidden = true
            speak.text = "猜對了！！再來玩一次吧!!"
        }
        self.view.endEditing(true)
        inputNum.placeholder = inputNum.text
        inputNum.text = ""
        rangeLabel.text = "Range: \(minNum) ~ \(maxNum)"
    }
    @IBAction func again(_ sender: UIButton) {
        reset()
    }
    func reset(){
        minNum = 0
        maxNum = 50
        randomNum = Int.random(in: 1...50)
        inputNum.isEnabled = false
        bombBtn.isHidden = true
        guessBtn.isHidden = true
        goBtn.isHidden = false
        inputNum.placeholder = "?"
        moodImg.frame.origin.y = CGFloat(405)
        moodImg.image = UIImage(named: "drawing")
        rangeLabel.text = "快來猜猜數字是多少!"
        speak.text = ""
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
