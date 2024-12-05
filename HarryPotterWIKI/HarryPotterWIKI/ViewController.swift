//
//  ViewController.swift
//  HarryPotterWIKI
//
//  Created by Aya on 29/11/2024.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var characterstableView: UITableView!
    var arrCharacters = [Characters]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        fetchData()
        characterstableView.delegate = self
        characterstableView.dataSource = self
        let albusPotter = Characters(image: UIImage(named: "AlbusPotter")!,
                                     name: "AlbusPotter", sort: "Human", dateOfBirth: "1998")
        
        for _ in 1...12 {
            arrCharacters.append(albusPotter)
        }
    }
    
    func fetchData() {
        // Function body
        let url = "https://api.potterdb.com/v1/characters"

        // Make the request
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                if let data = data {
                    print("Response Data: \(String(data: data, encoding: .utf8) ?? "No data")")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        }
    }

extension ViewController: UITableViewDelegate {
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCharacters.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "charactersCell",
                                                       for: indexPath) as? CharactersTableViewCell else {
            fatalError("Failed to dequeue CharactersTableViewCell")
        }
        let data = arrCharacters[indexPath.row]
        cell.setupCell(photo: data.image, name: data.name, sort: data.sort, dateOfBirth: data.dateOfBirth)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell index = \(indexPath.row) ")
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = arrCharacters.count - 1
        if indexPath.row == lastItem {
            // loadMoreData()
        }
    }
   /* func loadMoreData()
{
        _ = arrCharacters.last
       // let newItem = lastItem + 1
       // arrCharacters.append(newItem)
    }*/
}

struct Characters {
    let image: UIImage
    let name: String
    let sort: String
    let dateOfBirth: String
}
