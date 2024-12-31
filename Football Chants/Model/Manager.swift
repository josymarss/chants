//
//  Manager.swift
//  Football Chants
//
//  Created by Josymarss on 30/12/24.
//

import Foundation

enum JobType: String {
    case headCoach = "Head Coach"
    case manager = "Manager"
}

struct Manager {
    let name: String
    let job: JobType
}
