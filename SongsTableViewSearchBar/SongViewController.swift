//
//  SongViewController.swift
//  SongsTableViewSearchBar
//
//  Created by David Lin on 12/3/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit
enum CurrentScope {
    case songName
    case artistName
}

class SongViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var songs = [Song]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData(){
        songs = Song.loveSongs
    }
    
}

extension SongViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songNameCell", for: indexPath)
        let songName = songs[indexPath.row]
        cell.textLabel?.text = songName.name
        cell.detailTextLabel?.text = songName.artist
        return cell
    }
}
