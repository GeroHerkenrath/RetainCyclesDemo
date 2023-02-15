//
//  ProblemView.swift
//  RetainCyclesDemo
//
//  Created by Gero Herkenrath on 15.02.23.
//

import SwiftUI

struct ProblemView: View {

    @StateObject var model = ProblemModel()

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.red)
            VStack {
                Text("Problem View")
                    .fontWeight(.bold)
                    .dynamicTypeSize(.xxxLarge)
                HStack {
                    Text("Caught Notifications:")
                    Text("\(model.caughtNotificationsCount)")
                }
                .padding()
            }
        }
    }
}

struct ProblemView_Previews: PreviewProvider {

    static var previews: some View {
        ProblemView()
    }
}
