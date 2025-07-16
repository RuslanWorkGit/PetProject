//
//  CameraViewModel.swift
//  mlexampleuse
//
//  Created by Ruslan Liulka on 16.07.2025.
//

import AVFoundation
import Vision
import CoreML
import SwiftUI

class CameraViewModel: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    @Published var classificationLabel: String = "Waiting..."
    
    private let session = AVCaptureSession()
    private var model: VNCoreMLModel?
    
    override init() {
        super.init()
        
        setupModel()
        setupCamera()
    }
    
    var captureSession: AVCaptureSession {
        return session
    }
    
    
    private func setupModel() {
        guard let gestureModel = try? example_5s0_hand_model(configuration: MLModelConfiguration()).model,
              let visionModel = try? VNCoreMLModel(for: gestureModel) else {
            print("Error dowload model")
            return
        }
        
        self.model = visionModel
        
    }
    
    
    private func setupCamera() {
        
        session.beginConfiguration()
        session.sessionPreset = .high
        
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
              let input = try? AVCaptureDeviceInput(device: device),
              session.canAddInput(input) else {
            
            print("Error access to camera")
            return
            
        }
        
        session.addInput(input)
        
        let output = AVCaptureVideoDataOutput()
        output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        
        guard session.canAddOutput(output) else {
            return
        }
        
        session.addOutput(output)
        session.commitConfiguration()
        session.startRunning()
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        //Перевірка існування моделі
        guard let  pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer),
              let model = model else { return }
        
        //Створення image
        let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
            guard let results = request.results as? [VNClassificationObservation],
                  let topResult = results.first else { return }
            
            DispatchQueue.main.async {
                self?.classificationLabel = "\(topResult.identifier) (\(Int(topResult.confidence * 100)))%"
            }
        }
        
        try? handler.perform([request])
    }
    
     
}
