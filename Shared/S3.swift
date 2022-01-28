//
//  S3.swift
//  Sum Series
//
//  Created by Alaina Thompson on 1/28/22.
//

import SwiftUI

class Series3: NSObject, ObservableObject {
    
    var n = 0.0
    var N = 100.0
    var sum3 = 0.0
    
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
