//
//  Team.swift
//  Football Chants
//
//  Created by Josymarss on 30/12/24.
//

import Foundation


class Team {
    let id: TeamType
    let name: String
    let info: String
    let manager: Manager
    let founded: String
    var isPlaying: Bool = false
    
    internal init(id: TeamType, name: String, info:String, manager:Manager, founded: String, ispLaying: Bool = false) {
        self.id = id
        self.name = name
        self.info = info
        self.manager = manager
        self.founded = founded
        self.isPlaying = ispLaying
    }
}
