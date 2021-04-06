//
//  HomeViewController.swift
//  EspIosConnect
//
//  Created by OUDJAMA Moussa (Canal Plus) on 08/02/2021.
//

import UIKit
import Alamofire
//MASTER +1 PR REBASE
class HomeViewController: UIViewController, StreamDelegate {
    
    @IBOutlet weak var alarmImageView: UIImageView!
    @IBOutlet weak var testLedButton: UIButton!
    @IBOutlet weak var alarmLabel: UILabel!
    @IBOutlet weak var mdpToolsButton: UIButton!
    var ledState = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.alarmImageView.image = UIImage(named: "ledGREEN")
        requesterLed()
        Timer.scheduledTimer(timeInterval: 1, target: self,selector: #selector(requestAlarmState), userInfo: nil, repeats: true)
    }
    
    func requesterLed() {
        //test
        //test2
        AF.request("http://10.33.1.105/led?state=\(ledState)").responseString { response in
            print(response)
        }
    }
    
    @objc func requestAlarmState(){
        AF.request("http://10.33.1.63/getAlarm").responseJSON { response in
            switch response.result {
            case .success(let value):
                print("RESPONSE SUCCESS")
                guard let json = value as? [String: Any] else {return}
                guard let alarmStateValue = json["alarmState"] else {return}
                if alarmStateValue as! String == "true" {
                    self.alarmLabel.text = "Tout est sous controle"
                    self.alarmImageView.image = UIImage(named: "ledGREEN")
                }else {
                    self.alarmLabel.text = "Detection, verifiez votre equipements"
                    self.alarmImageView.image = UIImage(named: "redLED")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @IBAction func goToMdpView(_ sender: Any) {
        self.navigationController?.pushViewController(PasswordViewController(), animated: true)
    }
    
    @IBAction func desactiver(_ sender: Any) {
    }
}
