//
//  ViewController.swift
//  ASsignment
//
//  Created by VENKATARAMA LAKAMRAJU on 2/22/21.
//  Copyright © 2021 VENKATARAMA LAKAMRAJU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var register: UIButton!
    @IBAction func OntapLogin(_ sender: Any) {
        
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
        else
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ListingScreen") as! ListingScreen
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
    }
    @IBAction func OntapRegister(_ sender: Any) {
        
        
        let appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDel.managedObjectContext

        let request = NSFetchRequest(entityName: "Books")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", "" + txtUsername.text!)

        let results:NSArray = try! context.executeFetchRequest(request)



        if(results.count > 1){
            let res = results[0] as! NSManagedObject
            txtUsername.text = res.valueForKey("username") as! String
            txtPassword.text = res.valueForKey("password") as! String

            //for res in results {
             //   print(res)
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)

        }else{
            
            
            let alertController = UIAlertController(title: "Alert", message: "Incorrect username and password", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                (result : UIAlertAction) -> Void in
                print("OK")
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            print("Incorrect username and password")
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
    }


}

