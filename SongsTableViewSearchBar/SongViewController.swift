//
//  SongViewController.swift
//  SongsTableViewSearchBar
//
//  Created by David Lin on 12/3/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit
enum SearchScope {
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
    
    var currentScope = SearchScope.songName
    
    var searchQuery = "" {
        didSet {
            switch currentScope {
            case .songName:
                Song.loveSongs = 
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        loadData()
    }
    
    func loadData() {
        songs = Song.loveSongs
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let songDVC = segue.destination as? SongsDetailedViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError()
        }
        let song = songs[indexPath.row]
        songDVC.songDetails = song
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

extension SongViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            loadData()
            return
        }
        searchQuery = searchText
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("selectedScope: \(selectedScope)")
        switch selectedScope {
        case 0:
            currentScope = .songName
            break
        case 1:
            currentScope = .artistName
            break
        default:
            print("not a valid scope")
        }
    }
}
