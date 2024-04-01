//
//  ColorListView.swift
//  Reminders
//
//  Created by Denys Zaiakin on 01.04.2024.
//

import SwiftUI
import AppKit

struct ColorListView: View {
    let colors: [Color] = [.red, .orange, .green, .blue, .purple]
    
    @Binding var selectedColor: Color

    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Image(systemName: selectedColor == color ? Constants.Icons.recordCircleFill : Constants.Icons.circleFill)
                    .foregroundStyle(color)
                    .font(.system(size: 16))
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedColor = color
                    }
            }
        }
    }
}

#Preview {
    ColorListView(selectedColor: .constant(.blue))
}
