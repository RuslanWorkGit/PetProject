//
//  SettingsRowView.swift
//  MedCareTrack
//
//  Created by Ruslan Liulka on 06.01.2024.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.large)
                .font(.title)
                .foregroundStyle(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.black)
            
        }
    }
}

#Preview {
    SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
}
