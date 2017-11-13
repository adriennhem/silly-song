//
//  ViewController+UITextField.swift
//  Silly Song
//
//  Created by Adrien Nhem on 13/11/2017.
//  Copyright © 2017 Adrien Nhem. All rights reserved.
//

import Foundation

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
