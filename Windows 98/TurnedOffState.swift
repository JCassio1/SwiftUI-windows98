//
//  TurnedOffState.swift
//  Windows 98
//
//  Created by MR.Robot 💀 on 11/08/2020.
//  Copyright © 2020 Joselson Dias. All rights reserved.
//

import SwiftUI

struct TurnedOffState: View {
    @EnvironmentObject var router: ViewRouter
    var body: some View {
        VStack {
            Button(action: {
                self.router.turnComputerOff = false
            }) {
                Text("Turn On")
                    .bold()
                    .font(.system(size: 30))
                    .foregroundColor(Color.black)
            }
            .frame(width: 300, height: 90)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.white, radius: 16)
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color.black)
    }
}

struct TurnedOffState_Previews: PreviewProvider {
    static var previews: some View {
        TurnedOffState()
    }
}
