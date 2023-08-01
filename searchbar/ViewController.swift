//
//  ViewController.swift
//  searchbar
//
//  Created by Neosoft on 01/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    var maindata = ["saad", "aditi" ,"chintan","saad", "aditi" ,"chintan","saad", "aditi" ,"chintan","saad", "aditi" ,"chintan"]
    var searcheddata : [String] = []

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        searcheddata = maindata
        tableview.delegate = self
        tableview.dataSource = self
        searchbar.delegate = self
        super.viewDidLoad()
    }
    
}
extension ViewController : UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searcheddata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.userlabel.text = searcheddata[indexPath.row]
        return cell
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
    heigh
    
    
}

