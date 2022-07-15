//
//  ViewController.swift
//  VK
//
//  Created by Кирилл Бережной on 15.07.2022.
//

import UIKit

class ViewController : UIViewController {
    
    //@IBOutlet var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://publicstorage.hb.bizmrg.com/sirius/result.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            let decoder = JSONDecoder()
            guard let data = data else { return }
            
            //let jsonString = String(data: data, encoding: .utf8)
            //print(jsonString)
            do {
                let services = try decoder.decode([Services].self, from: data)
                print(services.first?.link)
            } catch {
                print(error)
            }
            
        }.resume()
        
        
    }
    
}

