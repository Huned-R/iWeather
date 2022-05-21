//
//  CurrentPlaceView.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import SwiftUI

struct CurrentPlaceView: View {
    var name: String
    var date: String?
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .bold().font(.title)
                
                Text("\(date ?? "Today, " + Date().formatted(.dateTime.month().day().hour().minute()))")
                    .fontWeight(.light)
                
            }
            
            Spacer()
        }
    }
}

struct CurrentPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentPlaceView(name: "California")
    }
}
