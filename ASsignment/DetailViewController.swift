//
//  DetailViewController.swift
//  ASsignment
//
//  Created by VENKATARAMA LAKAMRAJU on 2/22/21.
//  Copyright © 2021 VENKATARAMA LAKAMRAJU. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var desctext: UITextView!
    var desc = String()
    var tittle = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        desctext.text = desc
        self.title = tittle
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
