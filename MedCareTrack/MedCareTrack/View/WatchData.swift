//
//  WatchData.swift
//  MedCareTrack
//
//  Created by Ruslan Liulka on 07.01.2024.
//

import SwiftUI

struct CabinetView: View {
    @ObservedObject var healthDataStore = HealthDataStore()

        var body: some View {
            List {
                if let heartRate = healthDataStore.heartRate {
                    HStack {
                        Text("Серцевий ритм")
                        Spacer()
                        Text("\(heartRate, specifier: "%.0f") уд/хв")
                    }
                }
            }
            .onAppear {
                healthDataStore.readHeartRateData()
            }
        }
    }

#Preview {
    CabinetView()
}
