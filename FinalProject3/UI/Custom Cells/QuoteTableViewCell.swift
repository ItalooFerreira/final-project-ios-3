//
//  QuoteTableViewCell.swift
//  FinalProject3
//
//  Created by Ítalo Ferreira on 09/12/18.
//  Copyright © 2018 Ítalo Ferreira. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {

    @IBOutlet weak var quoteLabel: UILabel!
    
    func configure(quote: String)  {
        quoteLabel.text = quote
    }

}
