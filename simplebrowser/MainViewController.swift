//
//  MainViewController.swift
//  simplebrowser
//
//  Created by Gabe Zimbric on 11/23/17.
//  Copyright © 2017 LampServ. All rights reserved.
//

import UIKit
import SafariServices

class MainViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var urlButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MainViewController.dismissKeyboard)))
        
        self.urlButton.layer.cornerRadius = 5
        self.urlButton.alpha = 0.70
        
        self.urlTextField.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissKeyboard() {
        urlTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func validateUrl (urlString: NSString) -> Bool {
        let urlRegEx = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
        return NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: urlString)
    }
    
    @IBAction func urlBrowser(_ sender: Any) {
        if let urlText = self.urlTextField.text {
            let url: URL?
            if (NSURL(string: urlText) != nil) {
                url = URL(string: "http://" + urlText)
                print ("Now browsing via URL in SFSafariViewController")
            } else {
                url = URL(string: "https://www.google.com/search?q=" + urlText)
                print ("Now browsing via Search in SFSafariViewController")
            }
            if let url = url {
                let sfViewController = SFSafariViewController(url: url)
                self.present(sfViewController, animated: true, completion: nil)
            }
        }
    }
}
