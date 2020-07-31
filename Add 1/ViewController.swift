//
//  ViewController.swift
//  Add 1
//
//  Created by Maithili Tole on 1/6/20.
//  Copyright (c) 2020 Maithili Tole. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var scoreLabel:UILabel?
    @IBOutlet weak var timeLabel:UILabel?
    @IBOutlet weak var numberLabel:UILabel?
    @IBOutlet weak var inputField:UITextField?
    
    var score = 0
    
    weak var gameTimer: NSTimer?
    var seconds = 60

    override func viewDidLoad()
    {
            super.viewDidLoad()

            UpdateScoreLabel()
            updateNumberLabel()
            updateTimeLabel()
    }
    
    func UpdateScoreLabel() {
        scoreLabel?.text = String(score)
    }
    
    func updateNumberLabel() {
        numberLabel?.text = String.randomNumber(4)
        
    }
    
    func updateTimeLabel() {
        let min = (seconds/60) % 60
        let sec = seconds % 60
        
        timeLabel?.text = String(format: "%02d", min) + ":" + String(format: "%02d", sec)
    }
    
    @IBAction func inputFieldDidChange()
    {
        let numberText = numberLabel?.text
        
          if numberText == nil {
            return
        }
        
        let inputText = inputField?.text
        
        if countElements(inputText!) != 4 {
            return
        }
            runGameTimer()
            var isCorrect = true
       
            for n in 0..<4
            {
                var input = Array(inputText!)[n]
                var number = Array(numberText!)[n]
                
                var input1 =  String(input).toInt()
                var number1 = String(number).toInt()
                
                if input1 == 0 {
                    input1 = 10
                }
                
                if input1! != number1! + 1 {
                    isCorrect = false
                    break
                }
            }
        
                if isCorrect == true {
                    score += 1
                } else {
                    score -= 1
                    
                }
        
                updateNumberLabel()
                UpdateScoreLabel()
                inputField?.text = ""
        
        // if timer == nil {
            
           // let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self , selector: "onTimerFires", userInfo: nil, repeats: true)
       // }

    }
    
        func runGameTimer() {
            
            gameTimer?.invalidate()
            
            gameTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self , selector: "onTimerFires", userInfo: nil, repeats: true)
            
        }
        
   // }

    func onTimerFires() {
    
      if seconds == 0 {
          finishGame()
      } else if seconds <= 60 {
        seconds -= 1
        updateTimeLabel()
    
      }
    }
    
    func finishGame()    {
        
       

        updateTimeLabel()
        UpdateScoreLabel()
        updateNumberLabel()
    
    let alert = UIAlertController(title: "Time's Up!", message: "Your time is up! You got a score of \(score) points. Awesome!", preferredStyle: UIAlertControllerStyle.Alert)
    
    alert.addAction(UIAlertAction(title: "OK, start new game", style: UIAlertActionStyle.Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
        
      score = 0
      seconds = 60
      gameTimer?.invalidate()
      gameTimer = nil
        
     }
}





