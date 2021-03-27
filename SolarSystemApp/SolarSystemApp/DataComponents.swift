//
//  ApiData.swift
//  SolarSystemApp
//
//  Created by Rodrigo Ryo Aoki on 23/02/21.
//

import Foundation

//protocol DataFuncs {
//    func getData(url: String) -> Body
//}

struct AllBodies: Codable{
    let bodies: [Body]!
}

struct Body: Codable{
    let name: String?
    let englishName: String?
    let gravity: Double?
    let meanRadius: Double?
    let discoveryDate: String?
    let alternativeName: String?
    let moons: [Moon]?
}

struct Moon: Codable {
    let moon: String?
    let rel: String?
}

//usar a func abaixo quando for delegar para outra classe

func CheckInfoExists(info: String) -> String{
    if(info != ""){
        return info
    }
    return "???"
}

func getData(from body: String, fullUrl: Bool) -> AllBodies{
    var res: AllBodies!
    
    var url: String
    
    if (fullUrl == false) {
        url = "https://api.le-systeme-solaire.net/rest/bodies/\(body)"
    } else {
        url = body
    }
    
    let group = DispatchGroup()
    group.enter()
    URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
        guard let data = data, error == nil else {
            print("error getData")
            return
        }
        var result: AllBodies
        do {
            result = try JSONDecoder().decode(AllBodies.self, from: data)
            res = result
        }
        catch {
            print("error convert \(error.localizedDescription)")
        }
        group.leave()
    }).resume()
    group.wait()
    return res
}

class UserDefaultManager{
    
    enum Key : String {
        case alreadyOpened
    }
    
    static let shared = UserDefaultManager()
    private var userDefaults : UserDefaults
    private init() {self.userDefaults = UserDefaults.standard}
    
    func getIsFirstTime(forKey key : Key) -> Bool {
        return userDefaults.bool(forKey: key.rawValue)
    }
    
    func storeValue(forKey key : Key, value : Any){
        userDefaults.set(value, forKey: key.rawValue)
    }
}
