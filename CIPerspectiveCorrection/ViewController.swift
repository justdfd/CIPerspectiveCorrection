//
//  ViewController.swift
//  CIPerspectiveCorrection
//
//  Created by Dave Dombrowski on 9/17/18.
//  Copyright © 2018 justDFD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let ciOriginal = CIImage(image: UIImage(named: "original.png")!)
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func cropImage(_ sender: UIButton) {
        
        let inputBottomLeft = CIVector(x: 38, y: 122)
        let inputTopLeft = CIVector(x: 68, y: 236)
        let inputTopRight = CIVector(x: 146, y: 231)
        let inputBottomRight = CIVector(x: 151, y: 96)

        let filter = CIFilter(name: "CIPerspectiveCorrection")
        filter?.setValue(inputTopLeft, forKey: "inputTopLeft")
        filter?.setValue(inputTopRight, forKey: "inputTopRight")
        filter?.setValue(inputBottomLeft, forKey: "inputBottomLeft")
        filter?.setValue(inputBottomRight, forKey: "inputBottomRight")

        filter?.setValue(ciOriginal, forKey: "inputImage")
        let ciOutput = filter?.outputImage
        
        imageView.image = UIImage(ciImage: ciOutput!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "original.png")
        // Do any additional setup after loading the view, typically from a nib.
    }


}

