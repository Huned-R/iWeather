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
            NavigationView {
                ScrollView(showsIndicators: false) {
                    weatherDetails
                }
                .ignoresSafeArea()
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
            }
            .background(appColor)
            .preferredColorScheme(.dark)
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
                
                CurrentPlaceView(name: viewModel.weather!.name)
                .padding()
                
                Spacer()
                
                VStack {
                    
                    CurrentTemperatureView(main: viewModel.weather!.weather.first?.main ?? "", feelsLike: viewModel.weather!.main?.feelsLike.toRoundedString() ?? "0")
                    
                    Spacer()
                        .frame(height: 80)
                    
                    CityImageView()
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                dailyForecastList
                    .edgesIgnoringSafeArea(.bottom)
            }
            .safeAreaInset(edge: .top, alignment: .center, spacing: 0) {
                Color.clear
                    .frame(height: 40)
                    .background(appColor)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(appColor)
        .preferredColorScheme(.dark)
        
    }
    
    @ViewBuilder
    fileprivate var dailyForecastList: some View {
        if let dailyForecast = viewModel.dailyForecast {
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Daily Forecast:")
                        .font(.title2)
                        .italic()
                        .bold()
                        .padding(.bottom)
                    
                    if let daily = dailyForecast.daily {
                        ForEach(daily) { forecast in
                            NavigationLink(destination: {
                                WeatherDetailView(dailyForecast: forecast)
                            }){
                                DailyWeatherItemView(item: forecast)
                            }
                        }
                    }
                }
                .padding()
                .background(appColor)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                    Color.clear
                        .frame(height: 20)
                        .background(appColor)
                }
            }
        } else {
            LoadingView()
                .task {
                    viewModel.getDailyForecast(latitude: location.latitude, longitude: location.longitude)
                }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(location: CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417))
            .previewInterfaceOrientation(.portrait)
    }
}
