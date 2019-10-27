//
//  ViewController.swift
//  IcmAdmin
//
//  Created by mehdi jung on 27/10/2019.
//  Copyright © 2019 mehdi jung. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var services = [Service]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }

    func fetchData() {
        let url = URL(string: "http://localhost:8080/services")!
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            let decoder = JSONDecoder()
            if let servicesArray = try? decoder.decode([Service].self, from: data) {
                DispatchQueue.main.async {
                    self.services = servicesArray
                    self.tableView.reloadData()
                    print("Loaded \(servicesArray.count) services.")
                }
            } else {
                print("unable to parse JSON response.")
            }
        }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let service = services[indexPath.row]
        cell.textLabel?.text = "\(service.name) - $\(service.price)"
        cell.detailTextLabel?.text = service.description
        
        return cell
    }
}

