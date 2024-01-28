//
//  ContentView.swift
//  June
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var position: MapCameraPosition = .automatic
    @Namespace var mapScope
    
    var body: some View {
        Map(position: $position, scope: mapScope){
            UserAnnotation()
        }.mapStyle(.hybrid(elevation: .realistic))
            .overlay(alignment: .bottomTrailing) {
                VStack {
                    MapUserLocationButton(scope: mapScope)
                    MapPitchToggle(scope: mapScope)
                    MapCompass(scope: mapScope)
                        .mapControlVisibility(.visible)
                }
                .padding(.trailing, 10)
                .buttonBorderShape(.circle)
            }
            .mapScope(mapScope)
    }
}

#Preview {
    ContentView()
}
