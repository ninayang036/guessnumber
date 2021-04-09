//
//  ABViewController.swift
//  guessnumber
//
//  Created by Yang Nina on 2021/4/8.
//

import UIKit
import GameplayKit

class ABViewController: UIViewController {

    @IBOutlet weak var tmp: UILabel!
    @IBOutlet weak var moodImg: UIImageView!
    @IBOutlet weak var goBtn: UIButton!
    @IBOutlet weak var guessBtn: UIButton!
    @IBOutlet weak var againBtn: UIButton!
    @IBOutlet var guessNumText: [UITextField]!
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var titleImg: UIImageView!
    @IBOutlet weak var recordTextView: UITextView!
    var enter = ""
    var correctNum:[String] = ["","","",""]
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reset()
    }
    
    @IBAction func start(_ sender: UIButton) {
        for i in 0...3{
            guessNumText[i].placeholder = "0"
            guessNumText[i].isEnabled = true
        }
        moodImg.image = UIImage(named: "artist")
        goBtn.isHidden = true
        guessBtn.isHidden = false
        titleImg.isHidden = true
    }
    @IBAction func guess(_ sender: UIButton) {
        var a = 0
        var b = 0
        for i in 0...3{
            if correctNum[i] == guessNumText[i].text{
                a += 1
            }
            else if correctNum.contains(guessNumText[i].text!){
                b += 1
            }
            enter.append(guessNumText[i].text!)
            guessNumText[i].placeholder = "0"
            guessNumText[i].text = ""
        }
        if a == 4{
            againBtn.isHidden = false
            guessBtn.isHidden = true
            showLabel.text = "猜對啦~再來玩一次吧^^"
            moodImg.image = UIImage(named: "sing")
        }
        else if a == 3{
            count += 1
            recordTextView.text += "[\(count)]: \(enter)        \(a)A\(b)B\r\n"
            showLabel.text = "差一點點而已!加油!!"
        }
        else{
            count += 1
            recordTextView.text += "[\(count)]: \(enter)        \(a)A\(b)B\r\n"
            let cheer:[String] = ["還要加把勁唷＠＠","太可惜啦!","再試試看吧!!"]
            showLabel.text = cheer.randomElement()
        }
        enter = ""
        self.view.endEditing(true)
    }
    @IBAction func again(_ sender: UIButton) {
        reset()
    }
    func creatnum(){
        let randomNum = GKShuffledDistribution(lowestValue: 0, highestValue: 9)
        for i in 0...3{
            correctNum[i] = "\(randomNum.nextInt())"
        }
    }
    func reset(){
        for i in 0...3{
            guessNumText[i].placeholder = "?"
            guessNumText[i].text = ""
            guessNumText[i].isEnabled = false
        }
        creatnum()
        moodImg.image = UIImage(named: "drawing")
        goBtn.isHidden = false
        guessBtn.isHidden = true
        againBtn.isHidden = true
        titleImg.isHidden = false
        showLabel.text = "一起來猜猜看!"
        recordTextView.text = ""
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
