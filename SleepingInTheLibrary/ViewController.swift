//
//  ViewController.swift
//  SleepingInTheLibrary
//
//  Created by Jarrod Parkes on 11/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {
  
  // MARK: Outlets
  
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var photoTitleLabel: UILabel!
  @IBOutlet weak var grabImageButton: UIButton!
  
  // MARK: Actions
  
  @IBAction func grabNewImage(_ sender: AnyObject) {
    setUIEnabled(false)
    getImageFromFlickr()
  }
  
  // MARK: Configure UI
  
  private func setUIEnabled(_ enabled: Bool) {
    photoTitleLabel.isEnabled = enabled
    grabImageButton.isEnabled = enabled
    
    if enabled {
      grabImageButton.alpha = 1.0
    } else {
      grabImageButton.alpha = 0.5
    }
  }
  
  // MARK: Make Network Request
  
  private func getImageFromFlickr() {
    
    // TODO: Write the network code here!
    //the inefficient way
    //let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.galleries.getPhotos&api_key=7e409e2c5721ab34176500da91303333&gallery_id=5704-72157622566655097&extras=url_m&format=json&nojsoncallback=1&api_sig=42fccc011b0a53dbec82f2a88a0dc530")
    
  }
}
