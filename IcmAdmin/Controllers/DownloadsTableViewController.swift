//
//  DownloadsTableViewController.swift
//  IcmAdmin
//
//  Created by mehdi jung on 29/10/2019.
//  Copyright © 2019 mehdi jung. All rights reserved.
//

import Foundation
import UIKit

class DownloadsTableViewController: UITableViewController {
    var downloads = [Download]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchDownloadData()
        
    }
    
    func fetchDownloadData() {
        let url = URL(string: "http://localhost:8080/api/downloads")!
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            let decoder = JSONDecoder()
            if let downloadsArray = try? decoder.decode([Download].self, from: data) {
                DispatchQueue.main.async {
                    self.downloads = downloadsArray
                    self.tableView.reloadData()
                    print("Loaded \(downloadsArray.count) downloads.")
                }
            } else {
                print("unable to parse JSON response for downloads.")
                print(response!)
            }
        }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return downloads.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "downloadCell", for: indexPath)
        let download = downloads[indexPath.row]
        cell.textLabel?.text = "\(download.name) - $\(download.price)"
        cell.detailTextLabel?.text = "\(download.category) | \(download.description)"
        
        return cell
    }

}
