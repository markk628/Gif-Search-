//
//  ViewController.swift
//  GiphySearchIOS
//
//  Created by Mark Kim on 6/5/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var network = GifNetwork()
    var gifs = [Gif]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func setUp() {
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.searchTextField.delegate = self
        searchBar.searchTextField.placeholder = "Look up a gif"
        searchBar.returnKeyType = .search
    }
    
    func searchGifs(for searchText: String) {
        network.fetchGifs(searchTerm: searchText) { gifArray in
            if gifArray != nil {
                self.gifs = gifArray!.gifs
                self.tableView.reloadData()
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gifCell") as! GifCell
        cell.gif = gifs[indexPath.row]
        return cell
    }
}

extension ViewController: UISearchTextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.text != nil {
            searchGifs(for: textField.text!)
        }
        return true
    }
    
}

