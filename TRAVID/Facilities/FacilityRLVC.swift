//
//  FacilityRLVC.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/23/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit

class FacilityRLVC: UIViewController {
    
    
    
    @IBOutlet weak var rlView: UIView!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        rlView.layer.cornerRadius = 10
        rlView.layer.shadowColor = UIColor.black.cgColor
        rlView.layer.shadowOpacity = 0.25
        rlView.layer.shadowOffset = CGSize.zero
        rlView.layer.shadowRadius = 5
        
        
        
        
        
        registerBtn.layer.cornerRadius = 5
        registerBtn.layer.shadowColor = UIColor.black.cgColor
        registerBtn.layer.shadowOpacity = 0.25
        registerBtn.layer.shadowOffset = CGSize.zero
        registerBtn.layer.shadowRadius = 5
        
        
        
        
        
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.shadowColor = UIColor.black.cgColor
        loginBtn.layer.shadowOpacity = 0.25
        loginBtn.layer.shadowOffset = CGSize.zero
        loginBtn.layer.shadowRadius = 5
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
