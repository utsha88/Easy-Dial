//
//  ViewController.swift
//  FindingEasyDial
//
//  Created by Utsha Guha on 22-9-17.
//  Copyright © 2017 Utsha Guha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var flag = isEasyDial("259876432")
        print(flag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isEasyDial(_ input:String) -> Bool {
        var cookies = [[Int]]()
        var k:Int = 1
    
        /**     Creating Matrix with all the numbers    **/
        for j in 1...3 {
            var row = [Int]()
            for i in k...k+2 {
                row.append(i)
                
            }
            k += 3
            cookies.append(row)
        }
        
        /**     Adding row column details of the input string   **/
        var rcArray:[(Int,Int)] = []
        for c:Character in input.characters{
            for l in 0...2{
                for i in 0...2 {
                    if String(cookies[l][i]) == String(c) {
                        rcArray.append((l+1,i+1))
                    }
                }
            }
        }
        
        /**     Getting row & column difference of the current & next character of input string   **/
        for counter in 0..<rcArray.count-1{
            let rowCounter = rcArray[counter].0
            let colCounter = rcArray[counter].1
            
            let rowCounter1 = rcArray[counter+1].0
            let colCounter1 = rcArray[counter+1].1
            
            var rDiff = 0
            var cDiff = 0
            rDiff = rowCounter - rowCounter1
            cDiff = colCounter - colCounter1
            
            if !(((rDiff == -1)
                || (rDiff == 0)
                || (rDiff == 1)) && ((cDiff == -1)
                    || (cDiff == 0)
                    || (cDiff == 1)))  {
                return false
            }
        }
        return true
    }
}

