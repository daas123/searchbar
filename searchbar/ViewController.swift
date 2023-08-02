//
//  ViewController.swift
//  searchbar
//
//  Created by Neosoft on 01/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var orderbuttonrefrence: UIButton!
    
    var orderbtn = false
    var maindata = ["saad", "aditi" ,"chintan"]
    var searcheddata : [String] = []
    
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
    
       let rightItem1 = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)
       let rightItem2 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(clickedCancel))
       let leftItem1 = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: nil)
       let leftItem2 = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
         
       rightItem2.tintColor = UIColor.black
       rightItem1.tintColor = UIColor.black
         
       leftItem1.tintColor = UIColor.black
       leftItem2.tintColor = UIColor.black
         
       navigationItem.title = "Data"
         
       navigationItem.leftBarButtonItems = [leftItem1, leftItem2]
       navigationItem.rightBarButtonItems = [rightItem1, rightItem2]
        
//        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: "circle")

        
        
        
        self.tableview.isEditing = false
        searcheddata = maindata
        tableview.delegate = self
        tableview.dataSource = self
        searchbar.delegate = self
//        navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
    }
    @objc func clickedCancel(){
            self.navigationController?.popViewController(animated: true)
        print("saad")
        }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.isNavigationBarHidden = true
//    }
    
    @IBAction func orderbutton(_ sender: UIButton) {
        if (orderbtn)
        {
            orderbtn = false
            tableview.isEditing = true
            orderbuttonrefrence.setImage(UIImage(systemName: "arrow.up.arrow.down.square.fill" ), for: .normal)
        }else{
            orderbtn = true
            tableview.isEditing = false
            orderbuttonrefrence.setImage(UIImage(systemName: "arrow.up.arrow.down.square"), for: .normal)
            
        }
    }
    
    
    
    
}
extension ViewController :UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searcheddata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.userlabel.text = searcheddata[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        let cnt = searcheddata[indexPath.row]
        let saad = storyboard?.instantiateViewController(withIdentifier: "SaadViewController") as! SaadViewController
        let chintan = storyboard?.instantiateViewController(withIdentifier: "ChintanViewController") as! ChintanViewController
        let aditi = storyboard?.instantiateViewController(withIdentifier: "AditiyaViewController") as! AditiyaViewController
        
        switch searcheddata[indexPath.row]
        {
        case "saad":
            navigationController?.pushViewController(saad, animated: true)
        case "chintan" :
            navigationController?.pushViewController(chintan, animated: true)
        case "aditi" :
            navigationController?.pushViewController(aditi, animated: true)
        default : print("hello")
        }
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searcheddata = searchText.isEmpty ? maindata : maindata.filter{
            $0.lowercased() == searchText.lowercased()
        }
        tableview.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchbar.text = ""
        searcheddata = maindata
        searchbar.endEditing(true)
        tableview.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete
        {
            searcheddata.remove(at: indexPath.row)
            tableView.reloadData()
        } else {
            print("Insert")
        }
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = searcheddata[sourceIndexPath.row]
        searcheddata.remove(at: sourceIndexPath.row)
        searcheddata.insert(item, at: destinationIndexPath.row)
    }
    
    
    
    
}

//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .none
//    }
//
//    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
//        return false
//    }
//
//    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
//        let movedobj = self.searcheddata[sourceIndexPath.row]
//        searcheddata.remove(at: sourceIndexPath.row)
////        searcheddata.insert(movedobj, at: proposedDestinationIndexPath.row)
//        searcheddata.insert(movedobj, at: proposedDestinationIndexPath.row)
//
//    }
// we can only use above function when we use tableview controller
