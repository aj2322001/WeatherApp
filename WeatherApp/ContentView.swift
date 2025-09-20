//
//  ContentView.swift
//  WeatherApp
//
//  Created by Archit  Joshi on 19/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // background
            BackgroundView(topColor: .blue, bottomColor: .blue.opacity(0.25))
            
            // Content
            VStack {
                CityNameView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(
                    imageName: "cloud.sun.fill",
                    temerature: 76
                )
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperatue: 76)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperatue: 88)
                    WeatherDayView(dayOfWeek: "THR", imageName: "wind.snow", temperatue: 55)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperatue: 60)
                    WeatherDayView(dayOfWeek: "DAT", imageName: "snow", temperatue: 25)
                }
                
                Spacer()
                
                Button {
                    print("Button Pressed")
                } label: {
                    ButtonView(title: "Change Day Time")
                }
                
                Spacer()

            }
            
            
        }
    }
}

 
#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperatue: Int
    var body: some View {
        VStack(spacing: 4){
            Text(dayOfWeek)
                .font(.system(size: 16,weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperatue)°" )
                .font(.system(size: 28,weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient (
            gradient: Gradient(colors: [topColor,bottomColor]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

struct CityNameView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32,weight: .medium))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temerature: Int
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temerature)°" )
                .font(.system(size: 70,weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom,40)
    }
}
