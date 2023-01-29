//
//  ResultViewController.swift
//  HashGenerator
//
//  Created by Gustavo Nunes Pereira on 25/01/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    var hashCode: String?
    var timer: Timer!
    var interval: CGFloat = 3;
    
    @IBOutlet var hashCodeLabel: UILabel!
    @IBOutlet var toastView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hashCodeLabel.text = slice();
        toastView.isHidden = true;
    }
    
    @IBAction func copyButtonTouch(_ sender: UIButton) {
        UIPasteboard.general.string = hashCodeLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines);
        toastView.isHidden = false;
        hideToastViewTimer();
    }
    
    func hideToastViewTimer() {
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(hideToastView), userInfo: nil, repeats: true);
    
    }
    
    @objc func hideToastView() {
        toastView.isHidden = true;
        timer.invalidate();
    }
    
    func slice() -> String {
        let index     = (hashCode?.firstRange(of: ":"))!;
        return String((hashCode?[index.lowerBound...])!).replacingOccurrences(of: ":", with: "");
    }
}
