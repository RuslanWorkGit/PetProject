//
//  NetworkConstant.swift
//  MVVMPatern
//
//  Created by Ruslan Liulka on 18.02.2024.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        //Singletone
    }
    
    public var apiKey: String {
        get {
            return "bcfdb7391902da79ee3c28ea459c4d04"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
    
}
