//
//  ButtonView.swift
//  WeatherApp
//
//  Created by Archit  Joshi on 20/09/25.
//
import SwiftUI

struct ButtonView: View {
    var title: String
    var textColor: Color = .blue.opacity(0.7)
    var backgroundColor: Color = Color.white
    var body: some View {
        Text(title)
            .frame(width: 280,height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}
