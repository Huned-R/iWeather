//
//  CityImageView.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import SwiftUI

struct CityImageView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350)
        } placeholder: {
            ProgressView()
        }
    }
}

struct CityImageView_Previews: PreviewProvider {
    static var previews: some View {
        CityImageView()
    }
}
