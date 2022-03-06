//
//  ViewController.swift
//  GettingDataExample
//
//  Created by Mücahit Eren Özkur on 6.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var campaigns = [Campaign]() {
            didSet {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        let campainRequest = CampaignRequest()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()

            campainRequest.getCampaign { result in
                
                switch result {
                case .success(let campaigns):
                    self.campaigns = campaigns
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }

    }

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campaigns.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "campaignCell", for: indexPath)
        cell.textLabel?.text = campaigns[indexPath.row].baslik
        return cell
    }
        
}

