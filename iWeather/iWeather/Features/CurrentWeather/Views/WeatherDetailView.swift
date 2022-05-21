//
//  NavigationDetailView.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import SwiftUI

struct WeatherDetailView: View {
    
    var dailyForecast: Daily
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Text("\(dailyForecast.humidity ?? 50)")
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                .background(appColor)
            }
            
        }
        
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(dailyForecast: previewDaily)
    }
}
