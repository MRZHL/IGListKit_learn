//
//  Weather.swift
//  MarslinkRefer
//
//  Created by Netban on 2019/7/5.
//  Copyright © 2019 scn. All rights reserved.
//

import Foundation

enum WeatherCondition: String{

    case cloudy = "Cloudy"
    case sunny = "Sunny"
    case partlyCloudy = "Partly Cloudy"
    case dustStorm = "Dust Storm"
    
    var Emojy: String{
        switch self {
        case .cloudy: return "☁️"
        case .sunny: return "☀️"
        case .partlyCloudy: return "⛅️"
        case .dustStorm: return "🌪"
        }
    }
}

class Weather: NSObject {
    let temperature: Int
    let high: Int
    let low: Int
    let date: Date
    let sunrise: String
    let sunset: String
    let condition: WeatherCondition
    
    init(
        temperature: Int,
        high: Int,
        low: Int,
        date: Date,
        sunrise: String,
        sunset: String,
        condition: WeatherCondition
        ) {
        self.temperature = temperature
        self.high = high
        self.low = low
        self.date = date
        self.sunrise = sunrise
        self.sunset = sunset
        self.condition = condition
    }
}
