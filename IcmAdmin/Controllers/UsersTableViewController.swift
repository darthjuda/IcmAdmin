//
//  UsersTableViewController.swift
//  IcmAdmin
//
//  Created by mehdi jung on 29/10/2019.
//  Copyright © 2019 mehdi jung. All rights reserved.
//

import Foundation
import UIKit

class UsersTableViewController: UITableViewController {
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchUserData()
        
    }
    
    func fetchUserData() {
        let url = URL(string: "http://localhost:8080/api/users")!
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            let decoder = JSONDecoder()
            if let usersArray = try? decoder.decode([User].self, from: data) {
                DispatchQueue.main.async {
                    self.users = usersArray
                    self.tableView.reloadData()
                    print("Loaded \(usersArray.count) users.")
                }
            } else {
                print("unable to parse JSON response for users.")
            }
        }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = "\(user.name) - \(user.forename)"
        cell.detailTextLabel?.text = "alias \(user.username) | \(user.phoneNumber) | \(user.birthdate)"
        
        return cell
    }

}

