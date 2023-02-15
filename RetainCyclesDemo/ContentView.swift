//
//  ContentView.swift
//  RetainCyclesDemo
//
//  Created by Gero Herkenrath on 15.02.23.
//

import SwiftUI

struct ContentView: View {

    @State private var showProblemView = false

    var body: some View {
        VStack {
            Button("Send Notification") {
                NotificationManager.postNotification()
            }
            .padding()
            Button("Toggle Lower View") {
                showProblemView = !showProblemView
            }
            .padding()
            if showProblemView {
                ProblemView()
                    .padding()
            } else {
                ZStack {
                    Rectangle()
                        .foregroundColor(.green)
                    Text("Normal View")
                        .fontWeight(.bold)
                        .dynamicTypeSize(.xxxLarge)
                }
                .padding()
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
