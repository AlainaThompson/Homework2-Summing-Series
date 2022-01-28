//
//  S1.swift
//  Sum Series
//
//  Created by Alaina Thompson on 1/28/22.
//

import SwiftUI

class Series1: NSObject, ObservableObject {
    
    var n = 0.0
    var N = 100.0
    var totalS1 = 0.0
    var sum1 = 0.0
    var S1 = [Double]()
    
    func calculateS1(N: Double) async -> Double {
        
        
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
    
    

    
    
    
    
}
