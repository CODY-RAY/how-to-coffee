//
//  StartViewController.swift
//  how to coffee
//
//  Created by cody's macbook on 6/21/17.
//  Copyright © 2017 crank llc. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var win = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if win {
        image.image = UIImage(named: "good")
        }else{
        image.image = UIImage(named: "upset")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
   
 
}
