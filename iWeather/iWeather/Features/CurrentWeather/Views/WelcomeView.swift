//
//  WeatherView.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManaager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the weather app.")
                    .bold().font(.title)
                
                Text("Please share you current location to get the weather in your area.").padding()
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManaager.requesLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
