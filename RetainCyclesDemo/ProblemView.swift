//
//  ProblemView.swift
//  RetainCyclesDemo
//
//  Created by Gero Herkenrath on 15.02.23.
//

import SwiftUI

struct ProblemView: View {

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.red)
            Text("Problem View")
                .fontWeight(.bold)
                .dynamicTypeSize(.xxxLarge)
        }
    }
}

struct ProblemView_Previews: PreviewProvider {

    static var previews: some View {
        ProblemView()
    }
}
