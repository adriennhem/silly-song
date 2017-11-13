//
//  ViewController.swift
//  Silly Song
//
//  Created by Adrien Nhem on 13/11/2017.
//  Copyright © 2017 Adrien Nhem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        lyricsView.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ sender: Any) {
        if let nameField = nameField.text {
            lyricsView.text = lyricsForName(lyricsTemplate: myTemplate, fullName: nameField)
        }
    }
}


// UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
        
    }
}



// shorten the name
func shortNameForName(longName: String) -> String {
    var shortName = longName.lowercased()
    shortName = shortName.folding(options: .diacriticInsensitive, locale: NSLocale.current)
    
    let vowelsSet = CharacterSet(charactersIn: "euioa")
    let range = shortName.rangeOfCharacter(from: vowelsSet)
    if let range = range {
        shortName = shortName.substring(from: range.lowerBound)
    }
    
    return shortName
}



// generate custom lyrics
func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameForName(longName: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}


// Template to use in lyricsForName
let myTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")
