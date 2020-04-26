//
//  FacilityMainVC.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/23/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation

class FacilityMainVC: UIViewController {

    
    
    @IBOutlet weak var MView: UIView!
    
    @IBOutlet weak var scanBtn: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var crnoLabel: UILabel!
    
    
    
   
    var facilityID = String()
    var code = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.facilityID = UserDefaults.standard.string(forKey: "facilityID") ?? ""
        
        print("facilityID: \(facilityID)")
        
        MView.layer.cornerRadius = 10
        MView.layer.shadowColor = UIColor.black.cgColor
        MView.layer.shadowOpacity = 0.25
        MView.layer.shadowOffset = CGSize.zero
        MView.layer.shadowRadius = 5
        
        
        
        scanBtn.layer.cornerRadius = 5
        scanBtn.layer.shadowColor = UIColor.black.cgColor
        scanBtn.layer.shadowOpacity = 0.25
        scanBtn.layer.shadowOffset = CGSize.zero
        scanBtn.layer.shadowRadius = 5

        
        
        AddFacilityData()
        
        
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (UserDefaults.standard.string(forKey: "1") == "1") {
            Alert()
            
            code = UserDefaults.standard.string(forKey: "code") ?? ""
            print("user code: \(code)")
            
            LoadProfileData()
            
            UserDefaults.standard.removeObject(forKey: "1")
        }
        
        else {
            
            print("key unavailable")
        }
    }
    
    
    //UserDefaults.standard.set(scanned, forKey: "1")
    
    
    
    

    
    //print("code:  \(code)")
    
    func Alert(){
        let alert = UIAlertController(title: "Scanned Successfully", message:
            "", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Close", style: .cancel))
        alert.view.tintColor = .black

        self.present(alert, animated: true, completion: nil)

    }
    
    
    
    
    func LoadProfileData(){
        
        
        
        
        let facilityRef = Database.database().reference().child("Facilities").child(facilityID)
        
        facilityRef.observeSingleEvent(of: DataEventType.value) { (snapshot) in
            
            

            
            
            
            let Values = snapshot.value as? NSDictionary
            let addrss = Values?["Address"] as? String
            let CRNo = Values?["CRNo"] as? String
            let FacilityName = Values?["FacilityName"] as? String
            let PhoneNumber = Values?["PhoneNumber"] as? String
            

            
            let currentDate = Date()
            let format = DateFormatter()
            format.timeZone = .current
            format.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateString = format.string(from: currentDate)

            
            
            let indivedualRef = Database.database().reference().child("Individuals").child(self.code).child("LastVisits")
            
            let key = indivedualRef.childByAutoId().key
            
            
            let facilityData : [String : AnyObject] = ["FacilityID" : self.facilityID as AnyObject,"Address" : addrss as AnyObject, "CRNo" : CRNo as AnyObject , "FacilityName" : FacilityName as AnyObject ,"PhoneNumber" : PhoneNumber as AnyObject, "Date" : dateString as AnyObject]
            
            
            
            indivedualRef.child(key!).setValue(facilityData)
            
            
            
            
        }
        
        
        
    }
    
    
    func AddFacilityData(){
        
        
        
        let facilityRef = Database.database().reference().child("Facilities").child(facilityID)
        
        
        facilityRef.observeSingleEvent(of: DataEventType.value) { (snapshot) in
            
            
            let Values = snapshot.value as? NSDictionary
            let CRNo = Values?["CRNo"] as? String
            let FacilityName = Values?["FacilityName"] as? String
            
            
            
            
            print("CRNo:  \(CRNo)")
            print("FacilityName:  \(FacilityName)")
            
            
            self.nameLabel.text = FacilityName
            self.crnoLabel.text = CRNo
            
            
        }
        
    }

    

    //qrreadingVC
    
    
    @IBAction func scanBtnTapped(_ sender: UIButton) {
        

        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "qrreadingVC") as! QRReadingVC
        self.present(nextViewController, animated: true, completion: nil)
        
    }
    
    
    
    
    
    

}
