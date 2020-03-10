//
//  FabricMovie.swift
//  testTabBar
//
//  Created by Lisbeth Eslava on 9/03/20.
//  Copyright © 2020 Lisbeth Eslava. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class FabricMovie {
    
    var moviesTR = Movies()
    var seriesTR = Movies()
    
    var final = false
    var actionReload:(()->Void) = {}
    
    let headers = [
        "content-type": "application/json;charset=utf-8"
    ]
    
    let params = [
        "api_key" : "409a3e7ecd202ae9fb2d2704ab356d64"
    ]

    init(tipo: Int, completion:@escaping()->Void) {
        let conexion = Connectivity.isConnectedToInternet
        if(conexion){
            scrapping(tipo: tipo)
            actionReload = completion
        }
    }
    
    func scrapping(tipo: Int){
        switch tipo {
        //movies
        case 1:
            loadInfo(urlAPI: "https://api.themoviedb.org/3/movie/top_rated", tipo: 1)
        //series
        case 2:
            loadInfo(urlAPI: "https://api.themoviedb.org/3/tv/top_rated", tipo: 2)
        default: break
        }
    }
    
    func loadInfo(urlAPI: String, tipo: Int){
        Alamofire.request(urlAPI, method: .get, parameters: self.params ,headers: self.headers).responseJSON { (respuesta) in
            if respuesta.result.isSuccess{
                if let answer = respuesta.result.value{
                    
                    switch tipo{
                    case 1:
                        self.moviesTR = Mapper<Movies>().map(JSON: answer as! [String : Any])!
                    case 2:
                         self.seriesTR = Mapper<Movies>().map(JSON: answer as! [String : Any])!
                    default:
                        break
                    }
                    self.actionReload()
                }
            }else{
                print("No jSON")
            }
        }

        }
    
    func getLengthSeriesTR() -> Int{
        return (seriesTR.movies?.count) != nil ? (seriesTR.movies?.count)!: 0
    }
    
    func getLengthMoviesTR() -> Int{
        return (moviesTR.movies?.count) != nil ? (moviesTR.movies?.count)!: 0
    }
    
}
