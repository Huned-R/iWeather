//
//  WeatherView.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import SwiftUI
import CoreLocation

struct WeatherView: View {
    
    var location: CLLocationCoordinate2D
    @ObservedObject var viewModel = CurrentWeatherViewModel()
    
    var body: some View {
        if viewModel.weather != nil {
            weatherDetails
        } else {
            LoadingView()
                .task {
                    viewModel.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                }
        }
    }
    
    fileprivate var weatherDetails: some View {
        ZStack(alignment: .leading) {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(viewModel.weather!.name)
                            .bold().font(.title)
                        
                        Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                            .fontWeight(.light)
                        
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                VStack {
                    HStack {
                        
                        VStack(spacing: 20) {
                            Image(systemName: "sun.dust")
                                .font(.system(size: 40))
                            
                            Text(viewModel.weather!.weather.first?.main ?? "")
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(viewModel.weather!.main.feelsLike.toRoundedString() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.603, saturation: 0.897, brightness: 0.314))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(location: CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417))
            .previewInterfaceOrientation(.portrait)
    }
}
