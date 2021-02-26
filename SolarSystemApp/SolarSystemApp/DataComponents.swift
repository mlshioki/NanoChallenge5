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

struct Body: Codable{
    let englishName: String?
    let gravity: Double?
    let meanRadius: Double?
    let discoveryDate: String?
    let alternativeName: String?
}

//usar a func abaixo quando for delegar para outra classe

func getData(from body: String) -> Body{
    var res: Body!
    let url = "https://api.le-systeme-solaire.net/rest/bodies/\(body)"
    let group = DispatchGroup()
    group.enter()
    URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
        guard let data = data, error == nil else {
            print("error getData")
            return
        }
        var result: Body
        do {
            result = try JSONDecoder().decode(Body.self, from: data)
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
