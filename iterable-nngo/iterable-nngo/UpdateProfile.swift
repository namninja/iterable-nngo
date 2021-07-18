//
//  UpdateProfile.swift
//  iterable-nngo
//
//  Created by Nam Ngo on 7/17/21.
//

import UIKit
import IterableSDK

class UpdateProfile: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateProfileTapped(_ sender: UIButton) {
       
        IterableAPI.email = "nam13ngo@gmail.com"
            // Example data fields
            let dataField : [String: Any] = [
                "firstName": "Nam",
                "isRegisteredUser": true,
                "SA_User_Test_Key": "completed"
            ]

            // Most important code
            IterableAPI.updateUser(dataField, mergeNestedObjects: false, onSuccess: myUserUpdateSuccessHandler, onFailure: myUserUpdateFailureHandler)
            
        

        func myUserUpdateSuccessHandler(data:[AnyHashable:Any]?) -> () {
            // success
            print("sent to Iterable success")
        }

        func myUserUpdateFailureHandler(reason:String?, data:Data?) -> () {
            // failure
            print("sent to Iterable failure")
        }
    }
    
    @IBAction func trackEventTapped(_ sender: UIButton) {
        
        IterableAPI.track(
            event: "mobileSATestEvent",
            dataFields: [
                "platform": "iOS",
                "isTestEvent": true,
                "url": "https://iterable.com/sa-test/nam",
                "secret_code_key": "Code_123"
                
            
            ]
        )
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
