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
    //tests
    //isWorking()
    let methodParams = [
      Constants.FlickrParameterKeys.Method : Constants.FlickrParameterValues.GalleryPhotosMethod,
      Constants.FlickrParameterKeys.APIKey : Constants.FlickrParameterValues.APIKey,
      Constants.FlickrParameterKeys.GalleryID : Constants.FlickrParameterValues.GalleryID,
      Constants.FlickrParameterKeys.Extras : Constants.FlickrParameterValues.MediumURL,
      Constants.FlickrParameterKeys.Format : Constants.FlickrParameterValues.ResponseFormat,
      Constants.FlickrParameterKeys.NoJSONCallback : Constants.FlickrParameterValues.DisableJSONCallback
    ]
    
    //https://developer.apple.com/reference/foundation/url
    let urlString = Constants.Flickr.APIBaseURL + escapedParameters(parameters: methodParams as [String : AnyObject])
    let url = URL(string: urlString)!
    let request = URLRequest(url: url)
    
    //https://developer.apple.com/reference/foundation/urlsession
    //https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/URLLoadingSystem/Articles/UsingNSURLSession.html#//apple_ref/doc/uid/TP40013509-SW1
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if error == nil {
        
        // there was data returned
        if let data = data {
          
          let parsedResult: [String:AnyObject]!
          do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
          } catch {
            displayError("Could not parse the data as JSON: '\(data)'")
            return
          }
          
          print(parsedResult)
        }
      }
    }
    
    task.resume()
  }
  
  //takes a dict of key-value pairs in the url and returns a string of these pairs with the correct format- each pair is seperates by an ampersand
  private func escapedParameters(parameters: [String:AnyObject]) -> String {
    
    if parameters.isEmpty{
      return ""
    }
    else{
      //array to store each key value pair as it is formatted
      var key_value_pairs = [String]()
      
      //iterate the dictionary
      for (key, val) in parameters{
        //assusmption: keys are always safe ASCII characters
        
        //convert value to string
        let stringVal = "\(val)"
        
        //convert stringVal to an ASCII compliant format
        //https://developer.apple.com/reference/foundation/nsstring/1411946-addingpercentencoding
        //https://developer.apple.com/reference/foundation/nscharacterset/1416698-urlqueryallowed
        let escapedVal = stringVal.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        //now have key and value as safe ASCII strings
        //appending them to array
        key_value_pairs.append(key + "=" + "\(escapedVal!)")
      }
      
      return "?\(key_value_pairs.joined(separator: "&"))"
    }
  }
  
  //testing escapedParameters()
  private func test_escapedParameters(){
    let someParameters = [
      "blah" : "blah blah",
      "ios" : "networking",
      "test" : "success"
    ]
    
    print(escapedParameters(parameters: someParameters as [String : AnyObject]))
    //?blah=blah%20blah&test=success&ios=networking
  }
  
  
  private func isWorking(){
    test_escapedParameters()
  }
  
}
