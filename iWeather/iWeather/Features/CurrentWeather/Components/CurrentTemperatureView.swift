//
//  CurrentLocationWithWeatherView.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import SwiftUI

struct CurrentTemperatureView: View {
    
    var main: String
    var feelsLike: String
    
    var body: some View {
        
        HStack {
            VStack(spacing: 5) {
                Image(systemName: "sun.dust")
                    .font(.system(size: 20))
                Text(main)
                    .font(.subheadline)
            }
            .frame(alignment: .leading)
            Spacer()
            Text(feelsLike + "°")
                .font(.title)
                .fontWeight(.bold)
                .padding()
        }
    }
}

struct CurrentTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentTemperatureView(main: "Clouds", feelsLike: "50")
    }
}
