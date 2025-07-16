//
//  ContentView.swift
//  mlexampleuse
//
//  Created by Ruslan Liulka on 16.07.2025.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @StateObject private var viewModel = CameraViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.classificationLabel)
                .font(.title)
                .padding()
            
            CameraPreview(session: viewModel.captureSession)
                .onAppear {
                    viewModel.captureSession.startRunning()
                }
                .onDisappear {
                    viewModel.captureSession.stopRunning()
                }
                
        }
        .padding()
    }
}


struct CameraPreview: UIViewRepresentable {
    
    let session: AVCaptureSession
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = UIScreen.main.bounds
        view.layer.addSublayer(previewLayer)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
