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
        
        self.searchButton.layer.cornerRadius = 5
        self.searchButton.alpha = 0.70
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
    
    @IBAction func urlBrowser(_ sender: Any) {
        if let urlText = self.urlTextField.text {
            let urlString = urlText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            let url: URL?
            if (urlString?.hasPrefix("http://"))! {
                url = URL(string: urlString!)
            } else if (urlString?.hasPrefix("https://"))! {
                url = URL(string: urlString!)
            } else {
                url = URL(string: "http://" + urlString!)
            }
            if let url = url {
                let sfViewController = SFSafariViewController(url: url)
                self.present(sfViewController, animated: true, completion: nil)
                print ("Now browsing via URL in SFSafariViewController")
            }
        }
    }
    
    @IBAction func searchBrowser(_ sender: Any) {
        if let urlText = self.urlTextField.text {
            let urlString = urlText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            if let url = URL(string: "https://www.google.com/search?q=" + urlString!) {
                let sfViewController = SFSafariViewController(url: url)
                self.present(sfViewController, animated: true, completion: nil)
                print ("Now browsing via Search in SFSafariViewController")
            }
        }
    }
}
