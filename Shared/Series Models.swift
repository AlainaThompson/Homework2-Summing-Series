//
//  Series Models.swift
//  Sum Series
//
//  Created by Alaina Thompson on 1/31/22.
//

import SwiftUI

class Series: NSObject, ObservableObject {
    
   
    var n = 0.0
    var N = 100.0
    var totalS1 = 0.0
    var sum1 = 0.0
    var sum2 = 0.0
    var sum3 = 0.0
    var S1 = [Double]()
    var S2 = [Double]()
    var S3 = [Double]()
    
    func initWithSeries(n: Int, N: Int) async -> Bool {
            
                
                let _ = await withTaskGroup(of:  Void.self) { taskGroup in
                    
            
                
                    taskGroup.addTask { let _ = await self.calculateS1(N: Int(self.N))}
                    taskGroup.addTask { let _ = await self.calculateS2(N: Int(self.N))}
                    taskGroup.addTask { let _ = await self.calculateS3(N: self.N)}
                
            }
    
    }
    
    
    func calculateS1(N: Int) async -> Double {
        
        
        if n <= 2.0*N {
            sum1 = (pow(-1.0, n)*n)/(n + 1.0)
            S1.append(sum1)
            n = n + 1
        }
        else {
            return totalS1 = S1.reduce(0, +)
        }
        return totalS1
    }
    
    
    
    
    
        func calculateS2(N: Int) async -> [Double] {
            
            var S2 = [Double]()
            
            if n <= N {
                sum2 = (-((2*n - 1)/2*n)) + (2*n)/(2*n + 1)
                S2.append(sum2)
                n = n + 1
            }
            else {
                return S2
            }
        return  S2
        }
    
        
        
    
        func calculateS3(N: Double) async -> [Double] {
            
            var S3 = [Double]()
            
            if n <= N {
                sum3 = 1.0/((2.0*n)*(2.0*n + 1.0))
                S3.append(sum3)
                n = n + 1
            }
            else {
                return S3
            }
            return S3
        }
    
    
    
        
        
        
        
        
        
        
        
        
    
   
}

