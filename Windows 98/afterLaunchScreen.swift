//
//  afterLaunchScreen.swift
//  Windows 98
//
//  Created by MR.Robot 💀 on 06/08/2020.
//  Copyright © 2020 Joselson Dias. All rights reserved.
//

import SwiftUI

struct afterLaunchScreen: View {
    var body: some View {
        Image("launch-screen")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }
}

struct afterLaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        afterLaunchScreen()
            .previewLayout(PreviewLayout.fixed(width: 2388, height: 1668))
    }
}
