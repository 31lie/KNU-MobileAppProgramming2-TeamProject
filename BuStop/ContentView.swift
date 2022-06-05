//
//  ContentView.swift
//  BuStop
//
//  Created by 이윤서 on 2022/05/08.
//  MobileAppProgramming2 Swift TeamProject


// geun check

import SwiftUI

struct ContentView: View {
    
    var body: some View {
//        버튼 클릭시버스정류장 정보 불러온 후 현재위치 n미터 이내 정류장이름을 String배열로 불러옮. 그리고 console에 출력
        let busstop = BusStopInfo(filePath: "/Users/geun/Desktop/input.csv")
        return Button {
            

            let listOfBusStop: [String]? = busstop.FindBusStop(200)
            if listOfBusStop == nil {
                print("위치정보 권한 없음")
            }
            else{
                for i in 0..<listOfBusStop!.count{
                    print(listOfBusStop![i])
                }
            }

        } label: {
            Text("click")
        }
//        Text("Hello")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
