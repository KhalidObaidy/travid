//
//  HideKeyboard.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/23/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit


extension UIViewController {
    
    
    func hideKeyboard(){
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hide))
        
        view.addGestureRecognizer(tapGesture)
        
    }
    
    
    @objc func hide(){
        view.endEditing(true)
    }
    
}
