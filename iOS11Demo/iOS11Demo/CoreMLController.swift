//
//  CoreMLController.swift
//  iOS11Demo
//
//  Created by danlan on 2017/6/22.
//  Copyright © 2017年 lxc. All rights reserved.
//

import UIKit
import CoreML
import Vision

class CoreMLController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var inputImage: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var confidenceLabel: UILabel!
    
    fileprivate lazy var resnet50 = Resnet50()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
        
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        self.inputImage.image = image
        picker.dismiss(animated: true, completion: nil)
        self.analyseImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Analyse
    func analyseImage() {
        
        let image = self.inputImage.image!
        do {
            let coreMLModel = try VNCoreMLModel(for: self.resnet50.model)
            let coreMLRequest = VNCoreMLRequest(model: coreMLModel, completionHandler: { (request, error) in
                
                if error != nil {
                    DispatchQueue.main.async {
                        self.resultLabel.text = "Error"
                        self.confidenceLabel.text = "NA"
                    }
                    return
                }
                
                guard let results = request.results, let cArray = results as? [VNClassificationObservation] else {
                    DispatchQueue.main.async {
                        self.resultLabel.text = "Error"
                        self.confidenceLabel.text = "NA"
                    }
                    return
                }
                
                var confidence: VNConfidence = 0.0
                var tempClassification: VNClassificationObservation?
                
                for (_, observation) in cArray.enumerated() {
                    
                    if observation.confidence > confidence {
                        tempClassification = observation
                        confidence = observation.confidence
                    }
                }
                DispatchQueue.main.async {
                    self.resultLabel.text = tempClassification?.identifier
                    self.confidenceLabel.text = "\(confidence)"
                }
            })
            
            let imageRequestHandler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
            try imageRequestHandler.perform([coreMLRequest])
            
        } catch {}
    }

}








