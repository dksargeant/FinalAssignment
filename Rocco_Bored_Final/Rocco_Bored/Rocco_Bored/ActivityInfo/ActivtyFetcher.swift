//
//  ActivtyFetcher.swift
//  Rocco_Bored
//
//  Created by Rocco Alexander on 2021-04-20.
//  033315151

import Foundation
class ActivityFetcher : ObservableObject{
    @Published var activity = Activity()
    
//    Singleton Instance
    private static var shared : ActivityFetcher?
    
    static func getInstance() -> ActivityFetcher{
        if shared != nil{
            return shared!
        }else{
            return ActivityFetcher()
        }
    }
//    Fetch Data From API
    func fetchDataFromAPI(){
        guard let api = URL(string: "https://www.boredapi.com/api/activity")else{return}
        
        URLSession.shared.dataTask(with: api){ (data: Data?, response: URLResponse?, error: Error?) in
            if let err = error{
                print(#function, "Could not fetch data",err)
            }else{
                // recieved data or res
                do{
                    if let jsonData = data{
                        let decoder = JSONDecoder()
                        let decodedList = try decoder.decode(Activity.self, from: jsonData)
                        DispatchQueue.main.async {
                            self.activity = decodedList
                        }
                        print(decodedList)
                    }else{
                        print(#function,"no json data has been recieved.")
                    }
                }catch let error{
                    print(#function,error)
                }
            }
        }.resume()
    }
}
