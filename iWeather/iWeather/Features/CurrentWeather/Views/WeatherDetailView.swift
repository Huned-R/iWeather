//
//  NavigationDetailView.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import SwiftUI

struct WeatherDetailView: View {
    @SwiftUI.Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var dailyForecast: Daily
    
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(dailyForecast.dt.toDate().formatted(.dateTime.month().day()))")
                        .bold()
                        .padding([.top, .bottom, .leading], 10)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: "\(dailyForecast.temp?.min.toRoundedString() ?? "0")°")
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: "\(dailyForecast.temp?.max.toRoundedString() ?? "0")°")
                    }
                    .padding([.leading, .trailing], 10)
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: "\(dailyForecast.windSpeed.toRoundedString() )ms")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(dailyForecast.humidity)%")
                    }
                    .padding([.leading, .trailing, .bottom], 10)
                }
                .background(.white)
                .cornerRadius(20, corners: [.allCorners])
                .padding()
                
                Spacer()
            }
            .foregroundColor(.black)
            .background(appColor)
            .ignoresSafeArea()
            .foregroundColor(.white)
            .navigationBarTitle("")
            .navigationBarHidden(false)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .background(appColor)
        .preferredColorScheme(.dark)
    }
    
    fileprivate var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Text("← Go back")
            }
            .foregroundColor(.white)
        }
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(dailyForecast: previewDaily)
    }
}
