//
//  Campaign.swift
//  GettingDataExample
//
//  Created by Mücahit Eren Özkur on 6.03.2022.
//

import Foundation

struct Campaign: Codable {
    let id, baslik, icerik, tarih: String
    let resim: String
    let durum: String
}
