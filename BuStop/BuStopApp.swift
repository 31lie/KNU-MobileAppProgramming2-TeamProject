//
//  BuStopApp.swift
//  BuStop
//
//  Created by 이윤서 on 2022/05/08.
//

import SwiftUI

@main
struct BuStopApp: App {
    var body: some Scene {
        WindowGroup {
            var busStop = BusStopInfo(filePath: "/Users/hwistarrrrr/Desktop/11.txt")
            var busStopList: [String]? = busStop.FindBusStop(200)
            ContentView(busStop: busStop, busStopList: busStopList)
        }
    }
}
