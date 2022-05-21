//
//  ContentView.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if let location = locationManager.location {
                    WeatherView(location: location)
                }
                else {
                    if locationManager.isLoading {
                        LoadingView()
                    } else {
                        WelcomeView().environmentObject(locationManager)
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            .background(Color(hue: 0.603, saturation: 0.897, brightness: 0.314))
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
