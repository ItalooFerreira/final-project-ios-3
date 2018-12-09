//
//  HomeViewController.swift
//  FinalProject3
//
//  Created by Ítalo Ferreira on 09/12/18.
//  Copyright © 2018 Ítalo Ferreira. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var quotes = [String]()
    var numberOfRows: Int { return quotes.count }
    let identifier = "QuoteCell"
    
    @IBAction func didTapLeave(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let quoteCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? QuoteTableViewCell else { fatalError("")}
        quoteCell.configure(quote: quotes[indexPath.row])
        
        return quoteCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 115.0
    }
}
