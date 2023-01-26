//
//  ResultViewController.swift
//  HashGenerator
//
//  Created by Gustavo Nunes Pereira on 25/01/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    var hashCode: String?
    
    @IBOutlet var hashCodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hashCodeLabel.text = slice();
    }
    
    func slice() -> String {
        let index     = (hashCode?.firstRange(of: ":"))!;
        return String((hashCode?[index.lowerBound...])!).replacingOccurrences(of: ":", with: "");
    }
}
