//
//  RegisterViewController.swift
//  ASsignment
//
//  Created by VENKATARAMA LAKAMRAJU on 2/22/21.
//  Copyright © 2021 VENKATARAMA LAKAMRAJU. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var reenterpassword: UITextField!
    @IBOutlet weak var register: UIButton!
    @IBAction func onTapregister(_ sender: Any) {
    
        
        if ((username.text?.isEmpty)!) && ((password.text?.isEmpty)!)
               {
                   let alertController = UIAlertController(title: "Alert", message: "Enter all fields", preferredStyle: UIAlertController.Style.alert)
                   let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                       (result : UIAlertAction) -> Void in
                       print("OK")
                   }
                   alertController.addAction(okAction)
                   self.present(alertController, animated: true, completion: nil)
               }
               else if ((username.text?.isEmpty)!)
               {
                   let alertController = UIAlertController(title: "Alert", message: "Enter Username", preferredStyle: UIAlertController.Style.alert)
                   let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                       (result : UIAlertAction) -> Void in
                       print("OK")
                   }
                   alertController.addAction(okAction)
                   self.present(alertController, animated: true, completion: nil)
               }
            
               else if ((password.text?.isEmpty)!)
                      {
                          let alertController = UIAlertController(title: "Alert", message: "Enter the Password", preferredStyle: UIAlertController.Style.alert)
                          let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                              (result : UIAlertAction) -> Void in
                              print("OK")
                          }
                          alertController.addAction(okAction)
                          self.present(alertController, animated: true, completion: nil)
                      }
            else if ((reenterpassword.text?.isEmpty)!)
                          {
                              let alertController = UIAlertController(title: "Alert", message: "Enter reenterpassword", preferredStyle: UIAlertController.Style.alert)
                              let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                                  (result : UIAlertAction) -> Void in
                                  print("OK")
                              }
                              alertController.addAction(okAction)
                              self.present(alertController, animated: true, completion: nil)
                          }
               else
               {
                
                let appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
                let context:NSManagedObjectContext = appDel.managedObjectContext

                let newUser = NSEntityDescription.insertNewObjectForEntityForName("Books", inManagedObjectContext: context) as NSManagedObject
                newUser.setValue(username.text, forKey: "username")
                newUser.setValue(password.text, forKey: "password")

                do {
                    try context.save()
                } catch {}

                print(newUser)
                print("Object Saved.")
                
                   let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                   let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                   self.navigationController?.pushViewController(nextViewController, animated: true)
               }
               
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
