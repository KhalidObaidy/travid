//
//  MainVC.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/21/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit
import Firebase

class MainVC: UIViewController {
    
    
    
    @IBOutlet weak var MView: UIView!
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var NationalID: UILabel!
    
    @IBOutlet weak var userQR: UIImageView!
    
    
    var UserID = String()
    
    
    var myString = String()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.UserID = UserDefaults.standard.string(forKey: "uid") ?? ""
   
        userQR.image = generateQRCode(from: UserID)
        
        
        LoadProfileData()
        
        
        
        

        MView.layer.cornerRadius = 10
        //        whiteView.layer.borderWidth = 1
        //        whiteView.layer.borderColor = UIColor.lightGray.cgColor
        MView.layer.shadowColor = UIColor.black.cgColor
        MView.layer.shadowOpacity = 0.25
        MView.layer.shadowOffset = CGSize.zero
        MView.layer.shadowRadius = 5
    }
    

    
    func generateQRCode(from string: String) -> UIImage? {
        
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    
    
    
    func LoadProfileData(){
        
        
        
        let userRef = Database.database().reference().child("Individuals").child(self.UserID)
        
        
        userRef.observeSingleEvent(of: DataEventType.value) { (snapshot) in
            
            
            let Values = snapshot.value as? NSDictionary
            
            
            
            // let DateOfBirth = Values?["DateOfBirth"] as? String
            // let Email = Values?["Email"] as? String
            let FullName = Values?["FullName"] as? String
            let IDCard = Values?["IDCard"] as? String
            // let Nationality = Values?["Nationality"] as? String
            // let sex = Values?["sex"] as? String
            //     print("uid: \(String(describing: uid))")
            
            
            
            print("FullName:  \(FullName)")
            print("IDCard:  \(IDCard)")
            
            
            
            
            
            self.NameLabel.text = FullName
            self.NationalID.text = IDCard
            
            
            
        }
        
    }

    
    
    
    

}
