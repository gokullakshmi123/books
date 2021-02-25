//
//  ListingScreen.swift
//  ASsignment
//
//  Created by VENKATARAMA LAKAMRAJU on 2/22/21.
//  Copyright © 2021 VENKATARAMA LAKAMRAJU. All rights reserved.
//

import UIKit

class ListingScreen: UIViewController,UITableViewDataSource,UITableViewDelegate {
    

    var bookslist:[Books]=[Books]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookslist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell?=Bookslisttable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell?.textLabel?.text = bookslist[indexPath.row].BookName
        cell?.detailTextLabel?.text = bookslist[indexPath.row].BookDesc
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController")as?"DetailViewController"
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
let vc = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                                        self.navigationController?.pushViewController(vc, animated: true)
        vc.desc = bookslist[indexPath.row].BookDesc
        vc.tittle = bookslist[indexPath.row].BookName
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBOutlet weak var Bookslisttable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fetchdata()
    }
    func fetchdata()
   {
    guard let filelocation=Bundle.main.url(forResource: "Bookslist", withExtension: "json")
    else
    {
        return
    }
    do{
        
        
        let data=try Data(contentsOf: filelocation)
        let recieveddata=try JSONDecoder().decode([Books].self, from: data)
        self.bookslist = recieveddata
        
        DispatchQueue.main.async{
            self.Bookslisttable.reloadData()
        }
    }
    catch{
        print("Error while decofing file")
    }
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
