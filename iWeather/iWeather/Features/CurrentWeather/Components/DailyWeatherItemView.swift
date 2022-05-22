//
//  DailyWeatherItemView.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import SwiftUI

struct DailyWeatherItemView: View {
    
    var item: Daily
    
    var body: some View {
        ZStack {
            
            Image("weather_bg")
                .resizable()
                .scaledToFill()
                .frame(height: 60)
                .cornerRadius(10)
                .blur(radius: 3)
            
            HStack {
                
                Image(systemName: "thermometer")
                
                Spacer()
                    .frame(width: 15)
                
                Text("\(item.temp?.max.toRoundedString() ?? "28")°C")
                    .bold()
                    .font(.title)
                
                Spacer()
                
                Text("\(item.dt.toDate().formatted(.dateTime.month().day()) )")
                    .bold()
                    .font(.title3)
                
            }
            .foregroundColor(.white)
            .padding(5)
        }
    }
}

struct DailyWeatherItemView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherItemView(item: previewDaily)
    }
}
