//
//  Course.swift
//  SwiftUIChallenge
//
//  Created by LW on 15/9/20.
//

import Foundation

struct Course: Decodable, Identifiable {
    var name: String
    var bannerUrl: String
    let id = UUID()
}
