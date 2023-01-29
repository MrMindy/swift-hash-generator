//
//  HomeViewController.swift
//  HashGenerator
//
//  Created by Gustavo Nunes Pereira on 23/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    //TODO: Configure Confirm Screen and Copy the result code to Clipboard with toast message.
    //TODO: Prevent user to generate hash with empty text
    
    @IBOutlet var hashCodeSegmentedControl: UISegmentedControl!
    @IBOutlet var inputTextView: UITextView!
    
    @IBOutlet var warningView: UIView!
    
    var timer: Timer!
    var interval: CGFloat = 3;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningView.isHidden = true;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destine       = segue.destination as! ResultViewController;
        destine.hashCode  = sender as? String;
    }
    
    @IBAction func generateButtonTouch(_ sender: UIButton) {
        
        if inputTextView.text.isEmpty {
            warningView.isHidden = false;
            hideWarningViewTimer();
            return;
        }
        
        var crypto = "";
        
        switch hashCodeSegmentedControl.titleForSegment(at: hashCodeSegmentedControl.selectedSegmentIndex) {
            case "SHA256":
                crypto = inputTextView.text.cryptoSHA256;
                break;
            case "MD5":
                crypto = inputTextView.text.cryptoMD5;
                break;
            case "SHA512":
                crypto = inputTextView.text.cryptoSHA512;
                break;
            default:
                crypto = inputTextView.text.cryptoSHA256;
                break;
        }
        
        
        performSegue(withIdentifier: "toResult", sender: crypto);
    }
    
    func hideWarningViewTimer() {
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(hideWarningView), userInfo: nil, repeats: true);
    
    }
    
    @objc func hideWarningView() {
        warningView.isHidden = true;
        timer.invalidate();
    }
    
    @IBAction func clearButtonTouch(_ sender: UIButton) {
        inputTextView.text = nil;
    }
    
}
