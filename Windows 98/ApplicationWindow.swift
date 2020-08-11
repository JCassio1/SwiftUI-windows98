//
//  ApplicationWindow.swift
//  Windows 98
//
//  Created by MR.Robot 💀 on 11/08/2020.
//  Copyright © 2020 Joselson Dias. All rights reserved.
//

import SwiftUI
import PencilKit

struct ApplicationWindow: View {
    @EnvironmentObject var router: ViewRouter
    @State var CloseButtonPressed: Bool = false
    @State var questionButtonPressed: Bool = false
        @State var viewState = CGSize.zero
    @Environment(\.undoManager) var undoManager
    @State private var canvasView = PKCanvasView()
    
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    Text("MS Paint")
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(Color.white)
                        .padding(.horizontal)
                        
                    Spacer()
                    Button(action: {
                        self.questionButtonPressed.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            self.questionButtonPressed = false
                        }
                    }) {
                        Image(systemName: "questionmark")
                            .renderingMode(.original)
                    }
                    .border(width: 5, edge: .top, color: questionButtonPressed ? .black : .white)
                    .border(width: 5, edge: .trailing, color: questionButtonPressed ? .white : .black)
                    .border(width: 5, edge: .bottom, color: questionButtonPressed ? .white : .black)
                    .border(width: 5, edge: .leading, color: questionButtonPressed ? .black : .white)
                    .frame(width:40, height: 40)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    
                        
                    
                    Button(action: {
                        self.CloseButtonPressed.toggle()
                        if self.CloseButtonPressed == true {
                            self.router.openPaint = false
                        }
                    }) {
                        Image(systemName: "xmark")
                        .renderingMode(.original)
                    }
                    .border(width: 5, edge: .top, color: CloseButtonPressed ? .black : .white)
                    .border(width: 5, edge: .trailing, color: CloseButtonPressed ? .white : .black)
                    .border(width: 5, edge: .bottom, color: CloseButtonPressed ? .white : .black)
                    .border(width: 5, edge: .leading, color: CloseButtonPressed ? .black : .white)
                    .frame(width:40, height: 40)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                }
                .frame(width: 790, height: 30)
                .padding(.vertical, 9)
                .background(Color(#colorLiteral(red: 0, green: 0.1781602864, blue: 0.6943502454, alpha: 1)))
                .gesture(DragGesture()
                .onChanged{ value in
                    self.viewState = value.translation
                }
                )
                Spacer()
                
                VStack {
                    HStack(spacing: 35) {
                        Button("Clear") {
                            self.canvasView.drawing = PKDrawing()
                        }
                        .foregroundColor(.black)
                        Button("Undo") {
                            self.undoManager?.undo()
                        }
                        .foregroundColor(.black)
                        Button("Redo") {
                            self.undoManager?.redo()
                        }
                        .foregroundColor(.black)
                    }
                    .padding()
                    
                    MyCanvas(canvasView: $canvasView)
                }
                .frame(width: 750 , height: 500)
                .background(Color.white)
                .padding()
            }
            .padding(.top, 3)
            .padding(.horizontal, 8)
        }
        .border(width: 5, edge: .top, color: .white)
        .border(width: 3, edge: .trailing, color: .black)
        .border(width: 3, edge: .bottom, color: .black)
        .border(width: 5, edge: .leading, color: .white)
        .frame(width: 800, height: 600)
        .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        .offset(x: viewState.width, y: viewState.height)
        
    }
}

struct ApplicationWindow_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationWindow()
    }
}

struct MyCanvas: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView

    func makeUIView(context: Context) -> PKCanvasView {
        self.canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) { }
}
