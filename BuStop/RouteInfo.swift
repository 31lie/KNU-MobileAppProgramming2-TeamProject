//
//  RouteInfo.swift
//  BuStop
//
//  Created by 최명빈 on 2022/05/25.
//

import Foundation
public class RouteInfo{
    func printRoute(_: [String]){
        let busStopObject: BusStopInfo = .init(filePath: "BusStopInfo.swift")
        print("busstop name: ", busStopObject.name)
    }
}
