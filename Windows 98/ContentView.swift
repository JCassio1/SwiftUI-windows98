//
//  ContentView.swift
//  Windows 98
//
//  Created by MR.Robot 💀 on 06/08/2020.
//  Copyright © 2020 Joselson Dias. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showLaunch: Bool = false
    @State var viewState = CGSize.zero
    @State var startPressed: Bool = false
//    @State var showStartPopup: Bool = false
    @EnvironmentObject var router: ViewRouter
    
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 0.04960969836, green: 0.439883709, blue: 0.4495689273, alpha: 1))
            
            Image("windows-logo")
                .resizable()
                .frame(width: 200, height: 200)
            
            //Yes! This part looks ugly and it can be easily cleaned with an array
            HStack {
                VStack(spacing: 90) {
                    VStack {
                        Image("computer_explorer-5")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Text("My Computer")
                        .underline()
                    }
                    VStack {
                        Image("iu-3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Text("My Documents")
                        .underline()
                    }
                    VStack {
                        Image("iu-9")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Text("Internet Explorer")
                        .underline()
                    }
                    VStack {
                        Image("msn3-5")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Text("MSN")
                        .underline()
                    }
                    VStack {
                        Image("iu-4")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Text("Recycle Bin")
                        .underline()
                    }
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 30)
                .foregroundColor(Color.white)
                Spacer()
            }
            
            VStack {
                Text("Hello")
                Spacer()
                HStack(spacing: 5) {
                    Button(action: {
                        self.startPressed.toggle()
                        self.router.startPopup.toggle()
                    }) {
                    Image("windows-logo")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 48)
                        
                       Text("Start")
                        .bold()
                        .font(.system(size: 38))
                        .foregroundColor(Color.black)
                    }
                    .border(width: 5, edge: .top, color: self.router.startPopup ? .black : .white)
                    .border(width: 5, edge: .trailing, color: self.router.startPopup ? .white : .black)
                    .border(width: 5, edge: .bottom, color: self.router.startPopup ? .white : .black)
                    .border(width: 5, edge: .leading, color: self.router.startPopup ? .black : .white)
                    .frame(width: 220, height: 65)
                    .padding(20)
                    .animation(.default)
                    
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        .border(width: 5, edge: .top, color: .white)
                        .border(width:  5, edge: .trailing, color: .black)
                        .border(width:  5, edge: .bottom, color: .black)
                        .border(width:  5, edge: .leading, color:.white)
                        .frame(width: 12, height: 65)
                        
                    Spacer()
                    
                    VStack {
                        Text("Made by Joselson Dias")
                    }
                    .border(width: 5, edge: .top, color: .black)
                    .border(width:  5, edge: .trailing, color: .white)
                    .border(width:  5, edge: .bottom, color: .white)
                    .border(width:  5, edge: .leading, color:.black)
                    .frame(width: 195, height: 65)
                    .padding()
                }
                .padding(.vertical, -10)
                .border(width: 5, edge: .top, color: Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)))
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            }
            
            if showLaunch {
                afterLaunchScreen()
            }
            
            if self.router.startPopup {
                VStack {
                    Spacer()
                    HStack {
                        StartPopUp()
                        Spacer()
                    }
                }
                .offset(y: -80)
            }
            
            if router.openPaint == true {
                VStack {
                    ApplicationWindow()
                }
            }
            
            if router.turnComputerOff == true {
                TurnedOffState()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.showLaunch = false
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(ViewRouter())
//            .previewLayout(PreviewLayout.fixed(width: 2388, height: 1668))
    }
}
