//
//  ContentView.swift
//  Shared
//
//  Created by Alaina Thompson on 1/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var series1Model = Series1()
    @State var nString = "1.0"
    @State var NString = "100.0"
    
    var body: some View {
        
        VStack{
            Text("N")
                .padding(.top)
                .padding(.bottom, 0)
            TextField("Enter N", text: $NString, onCommit: {Task.init {await self.S1(); await self.S2(); await self.S3()}})
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
                
        
            HStack{
                VStack{
            Text("Series 1")
                .padding(.bottom, 0)
            TextField("", text: ( $series1Model.series1Text))
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
                }
                VStack{
                    Text("Series 1")
                        .padding(.bottom, 0)
                    Text("\(series1Model.S1, specifier: "%.2f")")
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom,30)
                        
                    }

                
                
            }
            
            Button("Calculate", action: {Task.init { await self.calculateCircle()}})
                .padding(.bottom)
                .padding()
                .disabled(circleModel.enableButton == false)
            
            
        }
        
    }
    
    func calculateCircle() async {
        
        circleModel.setButtonEnable(state: false)
        
        let _ : Bool = await circleModel.initWithRadius(passedRadius: Double(radiusString)!)
        
        
    

}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
