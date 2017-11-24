//
//  MainViewController.swift
//  simplebrowser
//
//  Created by Gabe Zimbric on 11/23/17.
//  Copyright © 2017 LampServ. All rights reserved.
//

import UIKit
import SafariServices

class MainViewController: UIViewController {
    @IBOutlet weak var urlTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startBrowser(_ sender: Any) {
        if let url = self.urlTextField.text {
        let sfViewController = SFSafariViewController(url: NSURL(string: url)! as URL)
        self.present(sfViewController, animated: true, completion: nil)
        }
        print ("Now browsing in SFSafariViewController" )
    }
}
