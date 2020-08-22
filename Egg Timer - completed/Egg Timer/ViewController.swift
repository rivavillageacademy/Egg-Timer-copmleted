//
//  ViewController.swift
//  Egg Timer
//
//  Created by Muhamed Alkhatib on 21/08/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress=0.0
        // Do any additional setup after loading the view.
    }
    
    var count:Int=3
    var seconds:Int=3
    
    var timer: Timer?
    
    @IBOutlet weak var eggImageView: UIImageView!
    
    @IBAction func cookingSegmentControl(_ sender: UISegmentedControl) {
        
        print("Segmented changed")
        
        switch sender.selectedSegmentIndex
        {
        case 0: eggImageView.image=#imageLiteral(resourceName: "Soft"); count=3
        case 1: eggImageView.image=#imageLiteral(resourceName: "Medium"); count=5
        case 2: eggImageView.image=#imageLiteral(resourceName: "hard"); count=8
        default: print ("error")
            
            
        
        }
        seconds=count
        progressBar.progress=0.0
        resultLabel.text=""
        
    }
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func startPressed(_ sender: UIButton) {
        
        if timer != nil {
            timer?.invalidate()
        }
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
    @objc func update() {
        if(count > 0) {
            print (count)
            count=count-1
            
            progressBar.progress=1.0 - Float(count)/Float(seconds)
            
        } else {
            resultLabel.text="Time is over"
            timer?.invalidate()
        }
    }
    
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
}

