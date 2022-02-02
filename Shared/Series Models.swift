//
//  Series Models.swift
//  Sum Series
//
//  Created by Alaina Thompson on 1/31/22.
//

import SwiftUI

class Series: NSObject, ObservableObject {
    
    var n = 0
    var N = 100
    var totalS1 = 0.0
    var totalS2 = 0.0
    var totalS3 = 0.0
    var sum1 = 0.0
    var sum2 = 0.0
    var sum3 = 0.0
    
    @Published var NString = "100"
    @Published var totalS1Text = ""
    @Published var totalS2Text = ""
    @Published var totalS3Text = ""
    @Published var enableButton = true
    
    func initWithSeries(n: Int, N: Int) async -> Bool {
            
                
                let _ = await withTaskGroup(of:  Void.self) { taskGroup in
                    
            
                
                    taskGroup.addTask { let _ = await self.calculateS1(N: Int(self.N))}
                    taskGroup.addTask { let _ = await self.calculateS2(N: Int(self.N))}
                    taskGroup.addTask { let _ = await self.calculateS3(N: Int(self.N))}
                
            }
    
    }
    
    
    func calculateS1(N: Int) async -> Double {
        
        //  __ 2N         n   n
        //  \        ( - 1) -----
        //  /__ n=1         n + 1
        
        for n in stride(from: 0, through: 2*N, by: 1) {
            
            let pow1 = pow(-1, n)
            let numerator1 = Double(pow1)*Double(n)
            let denominator1 = n + 1
            let sum1 = numerator1/denominator1
           
            totalS1 += Double(sum1)
        }
        let newTotalS1Text = String(format: "%7.5f", totalS1)
        await updateTotalS1(totalS1TextString: newTotalS1Text)
        await newTotalS1Value(totalS1Value: totalS1)
        return totalS1
    }
    
    
    
    
    
    func calculateS2(N: Int) async -> Double {
            
        //     __ N   2n - 1       __ N      2n
        // -  \       ------  +   \        ------
        //    /__ n=1   2n        /__ n=1  2n + 1
          
            for n in stride(from: 0, through: N, by: 1) {
                let numerator2a = 2*n - 1
                let denominator2a = 2*n
                let sum2a = numerator2a/denominator2a
                let numerator2b = 2*n
                let denominator2b = 2*n + 1
                let sum2b = numerator2b/denominator2b
                let sum2 = sum2b - sum2a
                
                totalS2 += Double(sum2)
            }
            let newTotalS2Text = String(format: "%7.5f", totalS2)
            await updateTotalS2(totalS2TextString: newTotalS2Text)
            await newTotalS2Value(totalS2Value: totalS2)
            return totalS2
        }
    
        
        
    
        func calculateS3(N: Int) async -> Double {
            
            //   __ N        1
            //  \       ----------
            //  /__ n=1 2n(2n + 1)
            
          
            for n in stride(from: 0, through: N, by: 1) {
                let denominator3a = 2*n
                let denominator3b = 2*n + 1
                let sum3 = 1/(denominator3a*denominator3b)
               
                totalS3 += Double(sum3)
            }
            let newTotalS3Text = String(format: "%7.5f", totalS3)
            await updateTotalS3(totalS3TextString: newTotalS3Text)
            await newTotalS3Value(totalS3Value: totalS3)
            return totalS3
        }
    
    
    
    @MainActor func setButtonEnable(state: Bool){
              
              
              if state {
                  
                  Task.init {
                      await MainActor.run {
                          
                          
                          self.enableButton = true
                      }
                  }
                  
                  
                      
              }
              else{
                  
                  Task.init {
                      await MainActor.run {
                          
                          
                          self.enableButton = false
                      }
                  }
                      
              }
              
          }
          
         
          @MainActor func updateTotalS1(totalS1TextString: String){
              
              totalS1Text = totalS1TextString
              
          }
          
          @MainActor func newTotalS1Value(totalS1Value: Double){
              
              self.totalS1 = totalS1Value
              
          }
          
          @MainActor func newTotalS2Value(totalS2Value: Double){
              
              self.totalS2 = totalS2Value
              
          }
          
         
          @MainActor func updateTotalS2(totalS2TextString:String){
              
              totalS2Text = totalS2TextString
              
              
          }
    
        @MainActor func newTotalS3Value(totalS3Value: Double){
        
            self.totalS3 = totalS3Value
        
        }
    
   
        @MainActor func updateTotalS3(totalS3TextString:String){
        
            totalS3Text = totalS3TextString
        
        
        }
        
        
        
        
        
        
        
    
   
}

