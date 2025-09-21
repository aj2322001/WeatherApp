//
//  WeatherDayModel.swift
//  WeatherApp
//
//  Created by Archit  Joshi on 21/09/25.
//

import Foundation


struct WeatherDayModel: Identifiable {
    var id = UUID()
    
    let dayOfWeek: String
    let imageName: String
    let temperature: Double
    var isNight: Bool = false
}
