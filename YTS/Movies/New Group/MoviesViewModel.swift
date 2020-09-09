//
//  MoviesViewModel.swift
//  YTS
//
//  Created by ahmed elmemy on 8/28/20.
//  Copyright © 2020 ElMeMy. All rights reserved.
//

import Foundation

class MoviesViewModel : ObservableObject {
    
    @Published var Movies:[Movie] = []
    
    
    func FetchData(){
        
        let session = URLSession.shared
        let url = URL(string: "https://yts.mx/api/v2/list_movies.json")!
        let task = session.dataTask(with: url) { data, response, error in
            let response = response as? HTTPURLResponse
            if response?.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(MoviesModel.self, from: data!)
                    DispatchQueue.main.async {
                        self.Movies = response.data.movies
                    }
                    
                } catch {
                    print(error)
                }
                
            }else{
                print(response?.statusCode as Any)
                
            }
            
        }
        
        task.resume()
        
    }
    
    
    
    
}
