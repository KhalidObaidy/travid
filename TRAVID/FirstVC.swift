//
//  FirstVC.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/24/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    
    
    
    @IBOutlet weak var indivedualsBtn: UIButton!
    @IBOutlet weak var facilitiesBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        indivedualsBtn.layer.cornerRadius = 5
        indivedualsBtn.layer.shadowColor = UIColor.black.cgColor
        indivedualsBtn.layer.shadowOpacity = 0.25
        indivedualsBtn.layer.shadowOffset = CGSize.zero
        indivedualsBtn.layer.shadowRadius = 5
        
        
        facilitiesBtn.layer.cornerRadius = 5
        facilitiesBtn.layer.shadowColor = UIColor.black.cgColor
        facilitiesBtn.layer.shadowOpacity = 0.25
        facilitiesBtn.layer.shadowOffset = CGSize.zero
        facilitiesBtn.layer.shadowRadius = 5

       
    }
    

    

}
