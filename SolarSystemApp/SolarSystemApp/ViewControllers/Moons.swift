//
//  Moons.swift
//  SolarSystemApp
//
//  Created by Sayuri Hioki on 01/03/21.
//

import SwiftUI

struct luas{
    var lua: String
    var imagem: UIImage!
}

let lua1 = luas(lua: "Lua1", imagem: UIImage(named: "Lua.png"))
let lua2 = luas(lua: "Lua2", imagem: UIImage(named: "Lua.png"))

func criarLuas() -> [luas]{
    return [lua1, lua2]
}
