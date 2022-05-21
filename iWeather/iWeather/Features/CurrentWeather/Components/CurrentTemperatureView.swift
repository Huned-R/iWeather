//
//  CurrentLocationWithWeatherView.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import SwiftUI

struct CurrentTemperatureView: View {
    
    var temperature: String
    var feelsLike: String
    
    var body: some View {
        
        HStack {
            VStack(spacing: 20) {
                Image(systemName: "sun.dust")
                    .font(.system(size: 40))
                Text(temperature + "°")
            }
            .frame(width: 150, alignment: .leading)
            Spacer()
            Text(feelsLike + "°")
                .font(.system(size: 100))
                .fontWeight(.bold)
                .padding()
        }
    }
}

struct CurrentTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentTemperatureView(temperature: "40", feelsLike: "50")
    }
}
