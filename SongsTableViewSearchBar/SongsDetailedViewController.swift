//
//  SongsDetailedViewController.swift
//  SongsTableViewSearchBar
//
//  Created by David Lin on 12/3/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongsDetailedViewController: UIViewController {
    var songDetails: Song!
    
    @IBOutlet weak var stockImage: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockImage.image = UIImage(named: "loveSongs")
        songNameLabel.text = songDetails.name
        artistLabel.text = songDetails.artist
    }
}
