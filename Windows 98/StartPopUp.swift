//
//  StartPopUp.swift
//  Windows 98
//
//  Created by MR.Robot 💀 on 10/08/2020.
//  Copyright © 2020 Joselson Dias. All rights reserved.
//

import SwiftUI

struct StartPopUp: View {
    var body: some View {
        VStack {
            ForEach(menuSection) { item in
                MenuList(section: item)
            }
        }
        .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
    }
}

struct StartPopUp_Previews: PreviewProvider {
    static var previews: some View {
        StartPopUp()
            .environmentObject(ViewRouter())
    }
}


struct MenuList: View {
    @State var buttonPressed = false
    @EnvironmentObject var router: ViewRouter
    
    var section: Section
    var body: some View {
        Button(action: {
             self.buttonPressed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                self.buttonPressed = false
            }
            
            switch self.section.menuText {
                case "Paint":
                    self.router.openPaint = true
                    self.router.startPopup.toggle()
                case "Shut Down":
                    self.router.turnComputerOff = true
                    self.router.startPopup.toggle()
                default:
                    self.router.openPaint = self.router.openPaint
            }
            
//            if self.section.menuText == "Paint" {
////                HERE !!!!!!!!!!!!!!!!!!!!!!!!!
//                self.router.openPaint = true
//            }
        }) {
            HStack {
                HStack() {
                    Image(section.menuIcon)
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                    Text(section.menuText)
                        .font(.system(size: 29))
                        .foregroundColor(Color.black)
                }
            }
            .frame(width: 500, height: 90, alignment: .leading)
            .padding(.horizontal, 10)
        }
        .background(buttonPressed ? Color(#colorLiteral(red: 0.5746028938, green: 0.5746028938, blue: 0.5746028938, alpha: 1)) : Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0)))
    }
}

struct Section: Identifiable {
    var id = UUID()
    var menuIcon: String
    var menuText: String
}


let menuSection = [
    Section(menuIcon: "iu-3", menuText: "New Office Document"),
    Section(menuIcon: "iu-4", menuText: "Trash"),
    Section(menuIcon: "joystick-5", menuText: "Games"),
    Section(menuIcon: "paint", menuText: "Paint"),
    Section(menuIcon: "iu-8", menuText: "Documents"),
    Section(menuIcon: "iu-9", menuText: "Internet Explorer"),
    Section(menuIcon: "keys-5", menuText: "Password Manager"),
    Section(menuIcon: "network_drive-0", menuText: "Network Drives"),
    Section(menuIcon: "battery_alt-0", menuText: "Shut Down")
]
