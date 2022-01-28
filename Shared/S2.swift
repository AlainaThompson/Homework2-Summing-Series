//
//  S2.swift
//  Sum Series
//
//  Created by Alaina Thompson on 1/28/22.
//

import SwiftUI

class Series2: NSObject, ObservableObject {
    
    var n = 0.0
    var N = 100.0
    var sum2 = 0.0
    
    func calculateS2(N: Double) async -> [Double] {
        
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
    
    
    
    
    
    
    
}

