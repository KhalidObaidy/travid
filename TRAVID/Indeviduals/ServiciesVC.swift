//
//  ServiciesVC.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/21/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit

class ServiciesVC: UIViewController {

    
    
    @IBOutlet weak var SView: UIView!
    @IBOutlet weak var submetBtn: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SView.layer.cornerRadius = 10
        //        whiteView.layer.borderWidth = 1
        //        whiteView.layer.borderColor = UIColor.lightGray.cgColor
        SView.layer.shadowColor = UIColor.black.cgColor
        SView.layer.shadowOpacity = 0.25
        SView.layer.shadowOffset = CGSize.zero
        SView.layer.shadowRadius = 5
        
        
        
        
        submetBtn.layer.cornerRadius = 5
        submetBtn.layer.shadowColor = UIColor.black.cgColor
        submetBtn.layer.shadowOpacity = 0.25
        submetBtn.layer.shadowOffset = CGSize.zero
        submetBtn.layer.shadowRadius = 5
        
        
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
