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
    @State var numOfStop: String = ""
    @State var numOfBus: String = ""
    @State var busList : [String]? = []
    @State var stopList : [String]? = []
    var body: some View {
        //버튼 클릭시 버스정류장 정보 불러온 후 현재위치 n미터 이내 정류장이름을 String배열로 불러옮. 그리고 console에 출력

        let busstop = BusStopInfo(filePath: "/Users/choemyeongbin/Desktop/busStops.csv")
        let busstop1 = BusInfo(filePath: "/Users/choemyeongbin/Desktop/busStops.csv")
        let buses = CheckDest(filePath: "/Users/choemyeongbin/Desktop/busRoute.csv")
        let listOfBusStop: [String]? = busstop.FindBusStop(100)
        Button {
            if let checkListOfBusStop = listOfBusStop{
                for i in 0..<checkListOfBusStop.count{
                    print("list \(i): ",checkListOfBusStop[i])
                }
            }
        } label: {
            Text("정류장 출력")
        }
        //출발할 정류장 선택
        HStack{
            TextField("정류장 번호 입력", text: $numOfStop)
                .textFieldStyle(.roundedBorder)
            
            Button{
                busList = busstop1.FindBusInfo(from: listOfBusStop!, at: Int(numOfStop)!)
                print("선택한 정류장을 경유하는 버스")
                if let checkBusList = busList{
                    for i in 0..<checkBusList.count{
                        print("list \(i):",checkBusList[i])
                    }
                }
            } label: {
                Text("버스출력")
            } .buttonStyle(.borderless)
                .padding()
            
        }
        HStack{
            TextField("버스 번호 입력", text: $numOfBus)
                .textFieldStyle(.roundedBorder)
            
            Button{
                
                
                let selectedBus: String? = busList?[Int(numOfBus)!]
                if let checkSelectedBus = selectedBus{
                    print("선택한 버스: \(checkSelectedBus)")
                }
                stopList = buses.FindDest(from: busList!, at: Int(numOfBus)!)
                print("선택한 버스의 노선")
                if let checkStopList = stopList{
                    for i in 0..<checkStopList.count{
                        print("노선list \(i):",checkStopList[i])
                    }
                }
                
            } label: {
                Text("버스선택")
            } .buttonStyle(.borderless)
                .padding()
            
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
