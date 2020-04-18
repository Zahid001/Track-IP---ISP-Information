//
//  ViewController.swift
//  Track IP - ISP Information
//
//  Created by Md Zahidul Islam Mazumder on 14/4/20.
//  Copyright © 2020 Md Zahidul Islam Mazumder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var country: UILabel!
    
    @IBOutlet weak var countryCode: UILabel!
    
    @IBOutlet weak var regionName: UILabel!
    
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var zip: UILabel!
    
    @IBOutlet weak var lat: UILabel!
    
    @IBOutlet weak var lon: UILabel!
    
    @IBOutlet weak var timezone: UILabel!
    
    @IBOutlet weak var isp: UILabel!
    
    @IBOutlet weak var ip: UILabel!
    
    
    @IBOutlet weak var btn: UIButton!
    
    var latitude = 0.0
    var longitude = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.layer.cornerRadius = 5
        dataRequest()
    }


    @IBAction func btnAction(_ sender: UIButton) {
        
        performSegue(withIdentifier: "map", sender: self)
    }
    
    func dataRequest(){
        let url = URL(string: "http://ip-api.com/json")
        
        
        
        
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            

            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                
                if (error != nil) {
                    print(error as Any)
                } else {
                    if let data = data{
                        let jsonDecoder = JSONDecoder()
                        do {
                            let responseModel = try jsonDecoder.decode(Json4Swift_Base.self, from: data)
                            
                            DispatchQueue.main.async {
                                self.country.text = responseModel.country
                                self.countryCode.text = responseModel.countryCode
                                self.regionName.text = responseModel.regionName
                                self.city.text = responseModel.city
                                self.zip.text = responseModel.zip
                                self.timezone.text = responseModel.timezone
                                self.isp.text = responseModel.isp
                                self.ip.text = responseModel.query
                                self.lat.text = "\(responseModel.lat ?? 00)"
                                self.lon.text = "\(responseModel.lon ?? 00)"
                                self.latitude = responseModel.lat ?? 00
                                self.longitude = responseModel.lon ?? 00
                                
                            }
                            print(responseModel)
                        } catch  {
                            print(error)
                        }


                    }
                }

            })

            dataTask.resume()
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let vc = segue.destination as? ShowOnMapViewController {
            vc.pLat = self.latitude
            vc.pLong =  self.longitude
         }
    }

    }
    
    



