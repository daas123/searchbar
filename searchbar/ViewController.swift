//
//  ViewController.swift
//  searchbar
//
//  Created by Neosoft on 01/08/23.
//

import UIKit

//class ViewController: UIViewController {
//
//    var maindata = ["saad is wee ned to get fibsbibiubvuvbu beifbsdfbsdbs", "aditi" ,"chintanaditi fdobdoibibiobgobufbfobvobfdouboudbgobufgfuogbaditi fdobdoibibiobgobufbfobvobfdouboudbgobufgfuogbaditi fdobdoibibiobgobufbfobvobfdouboudbgobufgfuogbaditi fdobdoibibiobgobufbfobvobfdouboudbgobufgfuogb","saad", "aditi fdobdoibibiobgobufbfobvobfdouboudbgobufgfuogb" ,"chintan","saad", "aditi" ,"chintan","saad", "aditi" ,"chintan"]
//    var searcheddata : [String] = []
//
//    @IBOutlet weak var searchbar: UISearchBar!
//    @IBOutlet weak var tableview: UITableView!
//
//    override func viewDidLoad() {
//        searcheddata = maindata
//        tableview.delegate = self
//        tableview.dataSource = self
//        searchbar.delegate = self
//        super.viewDidLoad()
//    }
//
//}
//extension ViewController : UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return searcheddata.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//
//        cell.userlabel.text = searcheddata[indexPath.row]
//        return cell
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        searcheddata = searchText.isEmpty ? maindata : maindata.filter{
//            $0.lowercased() == searchText.lowercased()
//        }
//        tableview.reloadData()
//    }
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searchbar.text = ""
//        searcheddata = maindata
//        searchbar.endEditing(true)
//        tableview.reloadData()
//    }
//
//
//}
//
struct details{
    var name : String
    var dep : String
    var description : String
}
class ViewController: UIViewController {
    
    var maindata = [
        details(name: "saad", dep: "ios", description: "hello world"),
        details(name: "fdacd", dep: "dfdsfsd", description: "afdfdsfhdfvfdsvfuvdsuvvusvduvusvsvsvfdvvfuvfufvufvsufvsufvfusfvufvuf"),
        details(name: "dbfius", dep: "kjvbivj", description: "jfdisbsiubvudsbvbvudbvovibvbvsoxcihdoucsdiubsuidbibiusdbfbifbifbfudbfiusbfbudubisffbsfbs") ,
        details(name: "fhuifhsf", dep: "oaofafa", description: "asfaufbubfdufbfd")
    ]

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        let cellnib = UINib(nibName: "newTableViewCell" , bundle: nil)
        tableview.register(cellnib, forCellReuseIdentifier: "mycell")
        tableview.delegate = self
        tableview.dataSource = self
        super.viewDidLoad()
    }
    
}
extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return maindata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! newTableViewCell
        let ref = maindata[indexPath.row]
        cell.firstlabel.text = ref.name
        cell.secondlabel.text = ref.dep
        cell.thirdlabel.text = ref.description
        
        return cell
    }
    
    
    
}

