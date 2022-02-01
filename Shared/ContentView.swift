//
//  ContentView.swift
//  Shared
//
//  Created by Alaina Thompson on 1/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var seriesModel = Series()
    @State var nString = "1"
    @State var NString = "100"
    
    var body: some View {
        
        VStack{
            Text("N")
                .padding(.top)
                .padding(.bottom, 0)
            TextField("Enter N", text: $NString, onCommit: {Task.init {await self.calculateSeries()}})
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
                
        
            HStack{
                VStack{
            Text("Series 1 Sum")
                .padding(.bottom, 0)
            TextField("", text: ( $seriesModel.totalS1Text))
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
                    
            Text("Series 2 Sum")
                .padding(.bottom, 0)
            TextField("", text: ( $seriesModel.totalS2Text))
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
                    
            Text("Series 3 Sum")
                .padding(.bottom, 0)
            TextField("", text: ( $seriesModel.totalS3Text))
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
                    
                    
                    
                    
                    
                    
                }
                VStack{
                    Text("Series 1 Sum")
                        .padding(.bottom, 0)
                    Text("\(seriesModel.totalS1, specifier: "%.2f")")
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom,30)
                        
                    Text("Series 2 Sum")
                        .padding(.bottom, 0)
                    Text("\(seriesModel.totalS2, specifier: "%.2f")")
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom,30)
                    
                    Text("Series 3 Sum")
                        .padding(.bottom, 0)
                    Text("\(seriesModel.totalS3, specifier: "%.2f")")
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom,30)
                    
                    
                    }

                
                
            }
            
            Button("Calculate", action: {Task.init { await self.calculateSeries()}})
                .padding(.bottom)
                .padding()
                .disabled(seriesModel.enableButton == false)
            
            
        }
        
    }
    
    func calculateSeries() async {
        
        seriesModel.setButtonEnable(state: false)
        
        let _ : Bool = await seriesModel.initWithSeries(n: Int(nString)!, N: Int(NString)!)
        
    }
    

}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
