//
//  ViewController.swift
//  loopDrawPractice
//
//  Created by 林祐辰 on 2020/5/23.
//  Copyright © 2020 smirkiiiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberResult: UILabel!
    @IBOutlet weak var showRenderResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var sliderNum = 0
    var segmentNum = 0
    
    @IBAction func changeSegement(_ sender: UISegmentedControl) {
        segmentNum = sender.selectedSegmentIndex
    }
    
    @IBAction func changeNumber(_ sender: UISlider) {
        sliderNum = Int(sender.value)
        numberResult.text = String(sliderNum)
        switch segmentNum {
          case 0:
           normalSquare()
          case 1:
           finalRenderSquare()
          case 2 :
           identitySquare()
          case 3:
            interSquare()
          case 4:
            normalTriangle()
          case 5:
            upsideDownTriangle()
          case 6:
            pyramid()
          default:
            diamond()
        }
    }
    
    func normalSquare(){
     showRenderResult.text = "🍎"
      var labelPic = ""
       for _ in 1...sliderNum{
           for _ in 1...sliderNum{
               labelPic += "🍎"
            }
             labelPic += "\n"
        }
        showRenderResult.text = labelPic
    }
    
    func finalRenderSquare(){
        showRenderResult.text = "🍏"
           var labelPic = ""
           let rowNum = sliderNum
            for idenNum in 1...sliderNum{
                for _ in 1...sliderNum{
                    if(idenNum%rowNum == 0){
                        labelPic+="🍏"
                    }else{
                       labelPic+="🍎"
                    }
            }

                labelPic += "\n"
       }

        showRenderResult.text = labelPic
    }
    
    func identitySquare(){
     showRenderResult.text = "🍏"
       var labelPic = ""
        for idenNum in 1...sliderNum{
            for checkNum in 1...sliderNum{
                if(idenNum == checkNum){
                labelPic+="🍏"
                }else{
                labelPic+="🍎"
                }
            }
            labelPic += "\n"
        }
        showRenderResult.text = labelPic
    }
    
    func interSquare(){
        showRenderResult.text = "🍎"
        var labelPic = ""
        var rowNum = 0
         for _ in 1...sliderNum{
            for checkNum in 1...sliderNum{
                if(rowNum%2==0){
                    if(checkNum%2==0){
                        labelPic+="🍏"
                    }else if(checkNum%2==1){
                        labelPic+="🍎"
                    }
                }else if(rowNum%2==1){
                    if(checkNum%2==1){
                         labelPic+="🍏"
                     }else if(checkNum%2==0){
                         labelPic+="🍎"
                     }
                    
                }
            }
                   rowNum+=1
                   labelPic += "\n"
            }
        showRenderResult.text = labelPic
        }
    
    func normalTriangle(){
     showRenderResult.text = "🍎"
      var labelPic = ""
      var rowNum = 1
       for _ in 1...sliderNum{
           for _ in 1...rowNum{
              labelPic+="🍎"
            }
         
             rowNum+=1
             labelPic += "\n"
        }
        showRenderResult.text = labelPic
     }
    
    func upsideDownTriangle(){
     showRenderResult.text = "🍎"
      var labelPic = ""
      var descendRowNum = sliderNum
      for _ in 1...sliderNum{
           for _ in 1...descendRowNum{
              labelPic+="🍎"
            }
             descendRowNum-=1
             labelPic += "\n"
        }
        showRenderResult.text = labelPic
     }
    
    
    func pyramid(){
       showRenderResult.text = "🍎"

        var startAddGreenApple = 1
        var addRedAppleNum = 1
        var labelPic = ""
        
         for _ in 1...sliderNum{
            let finalGreenApple = sliderNum - startAddGreenApple
            
                if (finalGreenApple>=1){
                  for _ in 1...finalGreenApple{
                        labelPic+="🍏"
                    }
                }
            
             for _ in 1...addRedAppleNum{
                labelPic+="🍎"
              }
            
               startAddGreenApple+=1
               addRedAppleNum += 2
               labelPic += "\n"
          }
          showRenderResult.text = labelPic
       }
    
    func diamond(){
   
        showRenderResult.text = "🍎"
        var labelPic = ""
        var upperAppleNum = 1
        var startAddGreenApple = 1
        var allRows = 2*sliderNum - 1   // 2*3-1 = 5   2*4-1 = 7
        var upperHalfRow = (allRows+1)/2   // (5+1)/2 = 3  (7+1)/2 = 4
        var lowerHalfRow = (allRows-1)/2   // (5-1)/2 = 2   (7-1)/2 = 3
        for x in 1...upperHalfRow{
           let finalGreenApple = sliderNum - startAddGreenApple
      
            if(finalGreenApple>=1){
                for _ in 1...finalGreenApple{
                     labelPic+="🍏"
                }
            }
            for _ in 1...upperAppleNum{
                 labelPic+="🍎"
               }
            if(x<sliderNum){
            startAddGreenApple+=1
            upperAppleNum+=2
            }
           labelPic += "\n"
        }
        
        var underGreenApple = 1
        var underRedApple = upperAppleNum-2
      
        if(sliderNum>1){
         for _ in 1...lowerHalfRow{

            for _ in 1...underGreenApple{
                 labelPic+="🍏"
            }
            
            for _ in 1...underRedApple{
                 labelPic+="🍎"
               }
            underGreenApple+=1
            underRedApple-=2
            labelPic += "\n"
         }

     }
        showRenderResult.text = labelPic
    }
  }
