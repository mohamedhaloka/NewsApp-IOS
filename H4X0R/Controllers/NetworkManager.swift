//
//  File.swift
//  H4X0R
//
//  Created by Mohamed Nasr on 29/11/2021.
//

import Foundation



class NetworkManager : ObservableObject{
    
    @Published var postsData : [Posts] = [Posts]()
    
    @Published var loading : Bool = true
    
    func fetchData(){
                print("State 1")
        let urlString = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")
        print("State 2")
        let session = URLSession(configuration: .default)
        print("State 3")

        let task = session.dataTask(with: urlString!) { data, urlResponse, error in
            if(error == nil)
            {
                let jsonDecode = JSONDecoder()
                print("State 4")

                do{
                
                    let result = try jsonDecode.decode(Result.self, from: data!)
                    DispatchQueue.main.async {
                        print("State 5")
                        self.postsData = result.hits
                        self.loading = false
                    }
                }
                catch{
                    print("Errorr \(error)")
                }
            }
        }
        
        task.resume()
    }
        
}
