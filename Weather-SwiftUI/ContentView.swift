//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Nishant Taneja on 26/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(title: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
                HStack(spacing: 12) {
                    WeatherDayView(dayOfWeek: "SUN", imageName: "sun.max.fill", temp: 74)
                    WeatherDayView(dayOfWeek: "MON", imageName: "wind.snow", temp: 40)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "snow", temp: 30)
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind.snow", temp: 36)
                    WeatherDayView(dayOfWeek: "THU", imageName: "snow", temp: 28)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temp: 65)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.max.fill", temp: 80)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : .init("lightBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct WeatherDayView: View {
    let dayOfWeek: String
    let imageName: String
    let temp: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct CityTextView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 32, weight: .medium, design: .rounded))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    let imageName: String
    let temp: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
