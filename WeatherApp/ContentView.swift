//
//  ContentView.swift
//  WeatherApp
//
//  Created by Archit  Joshi on 19/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var weatherData: [WeatherDayModel] = [
        WeatherDayModel(
            dayOfWeek: "TUE",
            imageName: "cloud.sun.fill",
            temperature: 74
        ),
        WeatherDayModel(
            dayOfWeek: "Wed",
            imageName: "sun.max.fill",
            temperature: 88
        ),
        WeatherDayModel(
            dayOfWeek: "THR",
            imageName: "wind.snow",
            temperature: 55
        ),
        WeatherDayModel(
            dayOfWeek: "FRI",
            imageName: "sunset.fill",
            temperature: 60
        ),
        WeatherDayModel(
            dayOfWeek: "SAT",
            imageName: "snow",
            temperature: 28
        ),
    ]
    
    var body: some View {
        ZStack {
            // background
            BackgroundView(isNight: weatherData.first!.isNight)
            
            // Content
            VStack {
                CityNameView(cityName: "Bangalore, IN")
                
                MainWeatherStatusView(
                    imageName: weatherData.first!.isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temerature: 76
                )
                
                HStack(spacing: 20){
                    ForEach(weatherData) { weatherItem in
                        WeatherDayView(weatherData: weatherItem)
                    }
                }
                
                Spacer()
                
                Button {
                    weatherData[0].isNight.toggle()
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
    let weatherData: WeatherDayModel?
    var body: some View {
        if let weatherData {
            VStack(spacing: 4){
                Text(weatherData.dayOfWeek)
                    .font(.system(size: 16,weight: .medium))
                    .foregroundStyle(.white)
                Image(systemName: weatherData.imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(Int(weatherData.temperature))°" )
                    .font(.system(size: 28,weight: .medium))
                    .foregroundStyle(.white)
            }
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    var body: some View {
        LinearGradient (
            gradient: Gradient(colors: isNight ? [.black,.gray] : [.blue,.blue.opacity(0.25)]),
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
