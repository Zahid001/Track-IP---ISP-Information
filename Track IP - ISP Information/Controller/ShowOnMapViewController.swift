//
//  ShowOnMapViewController.swift
//  Track IP - ISP Information
//
//  Created by Md Zahidul Islam Mazumder on 15/4/20.
//  Copyright © 2020 Md Zahidul Islam Mazumder. All rights reserved.
//

import UIKit
import MapKit
class ShowOnMapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let annotation = MKPointAnnotation()
    var pLat = 43.6109200
    var pLong = 3.8772300
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let center = CLLocationCoordinate2D(latitude: pLat, longitude: pLong)

        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        annotation.coordinate = CLLocationCoordinate2D(latitude: pLat, longitude: pLong)
        mapView.addAnnotation(annotation)
        self.mapView.setRegion(region, animated: true)
        // Do any additional setup after loading the view.
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
