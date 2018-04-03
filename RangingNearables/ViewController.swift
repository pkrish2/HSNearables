//
//  ViewController.swift
//  RangingNearables
//
//  Created by Adarsh Kulkarni on 3/23/18.
//  Copyright © 2018 Pranab Krishnan. All rights reserved.
//

import UIKit
//import Alamofire

class ViewController: UIViewController,ESTNearableManagerDelegate {
    
    var nearables:Array<ESTNearable>!
    var nearableManager:ESTNearableManager!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         * Initialized local nearables array
         */
        nearables = []
        
        /*
         * Initialize nearables manager and start ranging
         * devices around with any possible type. When nearables are ranged
         * propper delegate method is invoke. Delegate method updates
         * nearables array and reload table view.
         */
        nearableManager = ESTNearableManager()
        nearableManager.delegate = self
        
//        var estnearables:ESTRequestGetNearables!
        
//        print("hello")
//        let urlString = URL(string: "https://cloud.estimote.com/v1/indoor/locations")
//
//        let task = URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
//
//            do{
//                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
////                        if let names = json["names"] as? [String] {
////                            print(names)
////                        }
//                    print("here")
//                    print(json)
//
//                }
//                catch let error as NSError {
//                    print("Failed to load: \(error.localizedDescription)")
//                }
//
//        }
//        task.resume()
        
//        var names: [String] = []
//        var contacts: [String] = []
//
//        let url=URL(string:"https://cloud.estimote.com/v1/indoor/locations")
//        do { print(try NSArray(contentsOf: url!) as Any) }
//        catch{}
        
//        do {
//            let allContactsData = try Data(contentsOf: url!)
//
//            let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : NSArray]
//
//            if let arrJSON = allContacts["contacts"] {
//                for index in 0...arrJSON.count-1 {
//
//                    let aObject = arrJSON[index] as! [String: Any]
//
//                    names.append(aObject["name"] as! String)
//                    contacts.append(aObject["email"] as! String)
//                }
//            }
//            print(names)
//            print(contacts)
//        }
//        catch {
//
//        }
        
//        if let path = Bundle.main.path(forResource: "identifier", ofType: "json") {
//        let url=URL(string:"https://cloud.estimote.com/v1/indoor/locations")
        
//        let peoplesArray = try JSONSerialization.jsonObject(with: Data(contentsOf: url!), options: JSONSerialization.ReadingOptions()) as? [String:Any]
        
//        do {
//            let result = try JSONSerialization.jsonObject(with: Data(url!), options: [.mutableContainers])
//            let resultArray = result as! NSMutableArray //->This should always work
//            print(resultArray) //->shows output...
//        } catch {
//            print(error)
//        }
    
        
        // Set up the URL request
        let todoEndpoint: String = "https://cloud.estimote.com/v1/indoor/locations"
        
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }

        let urlRequest = URLRequest(url: url)

        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error!)
                return
            }
            print(data)
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }

            do {
                guard let todo: NSArray = try JSONSerialization.jsonObject(with: responseData, options: [.mutableContainers])
                    as? NSArray else {
                        print("error ")
                        return
                }

                // now we have the todo
                // let's just print it to prove we can access it
                for element in todo {
                    print(element)
                }

                // the todo object is a dictionary
                // so we just access the title using the "title" key
                // so check for a title and print it if we have one
//                guard let todoTitle = todo["title"] as? String else {
//                    print("Could not get todo title from JSON")
//                    return
//                }
//                print("The title is: " + todoTitle)
            }
            catch  {
                print("error trying ")
                return
            }
        }
        task.resume()
        
        
//        let myUrl = URL(string:"https://cloud.estimote.com/v1/indoor/locations");
//
//        // Creaste URL Request
//        let request = NSMutableURLRequest(url: myUrl!);
//
//        // Set request HTTP method to GET. It could be POST as well
//        request.httpMethod = "GET"
//
//        // Excute HTTP Request
//        let task = URLSession.shared.dataTask(with: request as URLRequest) {
//            data, response, error in
//
//            // Check for error
//            if error != nil
//            {
//                print("error=\(String(describing: error))")
//                return
//            }
//
//            // Print out response string
//            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//            print("responseString = \(String(describing: responseString))")
//
//        }
//        task.resume()
        
        
    
//        URLSession.shared.dataTask(with: url!, completionHandler: {
//            (data, response, error) in
//            if(error != nil){
//                print("error")
//            }
//            else{
//                do{
//                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
//
//                   print(json)
//
//                }
//                catch let error as NSError{
//                    print(error)
//                }
//            }
//        }).resume()
//
//            var finalArray:[Any] = []
//
//            for peopleDict in peoplesArray! {
//                if let dict = peopleDict as? [String: Any], let peopleArray = dict["People"] as? [String] {
//                    finalArray.append(peopleArray)
//                }
//            }
        
//        print(peoplesArray as Any)
//        }
        
        
        
        
//        task.resume()
        
        
        
        
        
        
        
        
        nearableManager.startRanging(for: ESTNearableType.all)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func nearableManager(manager: ESTNearableManager!, didRangeNearables nearables: [AnyObject]!, withType type: ESTNearableType)
    {
        /*
         * Update local nearables array
         */
        self.nearables = nearables as! Array<ESTNearable>
//        print(nearables[1].isMoving)
        print("hello")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

