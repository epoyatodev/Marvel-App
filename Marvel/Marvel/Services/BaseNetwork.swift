//
//  BaseNetwork.swift
//  Marvel
//
//  Created by Enrique Poyato Ortiz on 27/3/23.
//

import Foundation

let server = "https://gateway.marvel.com"
var idHero: Int = 0

struct HTTPMethods {
    static let get = "GET"
    static let content = "application/json"
}

enum endpoints: String{
    case herosList = "/v1/public/characters"
    case seriesHeroList = "/series" // el id se lo concateno luego
}

enum params: String {
    case apikey = "b14864a41460468c9771d8208d184f6b"
    case ts = "1"
    case hashs = "bb54cc16d49ded387870ebb180fc64c6"
    case orderBy = "name"
    case limit = "100"
    
}

/// Description: Función en la que listo los heroes, pasandole todos los parametros necesarios para hacer la llamada
struct BaseNetwork{
    
    // Función para listar los heroes
    
    func getSessionHeros(filter: String) -> URLRequest {
        let urlCad: String = "\(server)\(endpoints.herosList.rawValue)"
        
        var urlComponents = URLComponents(url: URL(string: urlCad)!, resolvingAgainstBaseURL: true)
        

        let queryItems = [
            URLQueryItem(name: "apikey", value: "\(params.apikey.rawValue)"),
            URLQueryItem(name: "ts", value: "\(params.ts.rawValue)"),
            URLQueryItem(name: "hash", value: "\(params.hashs.rawValue)"),
            URLQueryItem(name: "orderBy", value: "\(params.orderBy.rawValue)"),
            URLQueryItem(name: "limit", value: "50"),

            filter == "" ? nil : URLQueryItem(name: "nameStartsWith", value: "\(filter)")
            

        ].compactMap { $0 }

        urlComponents?.queryItems = queryItems
        
        var urlRequest: URLRequest?
        
        if let urlWithParams = urlComponents?.url{
            // Creo la request
            var request = URLRequest(url: urlWithParams)
            request.httpMethod = HTTPMethods.get
            request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
            
            urlRequest = request
            
        } else {
            urlRequest = URLRequest(url: URL(string: "")!)
        }
        
        return urlRequest!
 
    }
    
    // Funcion que lista las series de cada heroe
    
    func getSessionHerosSeries(id: Int) -> URLRequest {
        let urlCad: String = "\(server)\(endpoints.herosList.rawValue)/\(id)\(endpoints.seriesHeroList.rawValue)"
        
        var urlComponents = URLComponents(url: URL(string: urlCad)!, resolvingAgainstBaseURL: true)
        

        let queryItems = [
            URLQueryItem(name: "apikey", value: "\(params.apikey.rawValue)"),
            URLQueryItem(name: "ts", value: "\(params.ts.rawValue)"),
            URLQueryItem(name: "hash", value: "\(params.hashs.rawValue)"),
            //URLQueryItem(name: "orderBy", value: "\(params.orderBy.rawValue)"),

        ]
        urlComponents?.queryItems = queryItems
        
        var urlRequest: URLRequest?
        
        if let urlWithParams = urlComponents?.url{
            // Creo la request
            var request = URLRequest(url: urlWithParams)
            request.httpMethod = HTTPMethods.get
            request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
            
            urlRequest = request
            
        } else {
            urlRequest = URLRequest(url: URL(string: "")!)
        }
        
        return urlRequest!
 
    }
}

