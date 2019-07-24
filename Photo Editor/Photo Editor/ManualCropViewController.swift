//
//  ManualCropViewController.swift
//  ManualCropViewController
//
//  Created by Khang Leon 7/25/19.
//  Copyright © 2019 Khang Le. All rights reserved.
//

import UIKit

protocol ManualCropViewControllerDelegate: class {
    func cropViewController(_ controller: ManualCropViewController, didFinishCroppingImage image: UIImage)
    func cropViewController(_ controller: ManualCropViewController, didFinishCroppingImage image: UIImage, transform: CGAffineTransform, cropRect: CGRect)
    func cropViewControllerDidCancel(_ controller: ManualCropViewController)
}

class ManualCropViewController: UIViewController {
    weak var delegate: ManualCropViewControllerDelegate?
    
    @IBOutlet weak var test: UIImageView!
    
    var rotationEnabled = false
    
    var toolbarHidden = false
    
    fileprivate var cropView = SECropView()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //image = UIImage(named: "IMG_0005")
        //imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        //imageView?.center = CGPoint(x: view.bounds.width/2, y: view.bounds.height/2)
        
        //view.addSubview(imageView!)
        //test.image = image
        test.image = image
        cropView.configureWithCorners(corners: [CGPoint(x: 120, y: 100),
                                                CGPoint(x: 270, y: 170),
                                                CGPoint(x: 280, y: 450),
                                                CGPoint(x: 120, y: 400)], on: test)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    @objc func cancel(_ sender: UIBarButtonItem) {
        delegate?.cropViewControllerDidCancel(self)
    }
    
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func testDone(_ sender: Any) {
        do {
            guard let corners = cropView.cornerLocations else { return }
            //image = image?.rotateImage(orientation: .right)
            let croppedImage = try SEQuadrangleHelper.cropImage(with: test.image!, quad: corners)
            test?.image = croppedImage
            delegate?.cropViewController(self, didFinishCroppingImage: croppedImage)
            
        } catch let error as SECropError {
            print(error)
        } catch {
            print("Something went wrong, are you feeling OK?")
        }
    }
    
    
    @objc func constrain(_ sender: UIBarButtonItem) {
        
    }
}
