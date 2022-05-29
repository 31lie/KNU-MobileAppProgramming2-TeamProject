//
//  ContentView.swift
//  BuStop
//
//  Created by 이윤서 on 2022/05/08.
//  MobileAppProgramming2 Swift TeamProject


// geun check
// bin check
import SwiftUI

struct ContentView: View {
    var body: some View {
                //버튼 클릭시버스정류장 정보 불러온 후 현재위치 n미터 이내 정류장이름을 String배열로 불러옮. 그리고 console에 출력
        
                let busstop = BusStopInfo(filePath: "/Users/choemyeongbin/Desktop/input.csv")

                let listOfBusStop: [String] = busstop.FindBusStop(10)
                Button {
                    
                    for i in 0..<listOfBusStop.count{
                        print("list \(i): ",listOfBusStop[i])
                    }
                    
                } label: {
                    Text("click")
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
