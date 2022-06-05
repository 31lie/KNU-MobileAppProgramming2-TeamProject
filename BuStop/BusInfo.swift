//
//  BusesInfo.swift
//  BuStop
//
//  Created by 최명빈 on 2022/05/30.
//

import Foundation
import CSV

// 정류장 선택 시 해당 정류장의 버스 정보 반환하는 클래스
class BusInfo{
//    var busStop: String?        // 정류장
    var numOfBuses: Int?        // 경유하는 버스 개수
    var buses: [String]?        // 경유하는 버스 리스트
    
    // csv파일에서 가져올 값 정류소아이디[0],모바일아이디[1],정류소명[2],영문명[3],시도[4],구군[5],동[6],경도[7],위도[8],경유노선수[9],경유노선[10]
    var name:[String] = []          //정류장 이름
    var busNum:[Int] = []        //해당 정류장 정차버스 수
    var busList:[[String]] = [[]]   //해당 정류장 버스 종류
    var sizeOfArray = 0             //총 배열의 크기
    
    var busIndex = [String: Int]()  //key: 정류장 이름, value: 정류장에 해당하는 index. 위 배열에 사용
    
    //파일 경로 설정
    init(filePath: String){
        //csv파일 읽기
        let stream = InputStream(fileAtPath: filePath)!
        let csv = try! CSVReader(stream: stream)
        
        busList.removeAll()     //버그 발생 방지
        //csv파일 정보  배열에 저장
        while let row = csv.next() {
            var bus: [String] = []
            
            name.append(row[2])
            if let checkBusNum = Int(row[9]){
                busNum.append(checkBusNum)
            }
            
            for j in 10..<row.count{
                bus.append(row[j])
            }
            
            busList.append(bus)
            busIndex[row[2]] = sizeOfArray
            sizeOfArray += 1
        }
    }
    
    func FindBusInfo(from busStops: [String], at idx:Int) -> [String]?{
//        self.numOfBuses = busStops.count    //주변 정류장 개수
        self.buses = busStops               //주변 정류장 배열
        var selectedBusStop: String? = ""
        var row = 0
        //주변 정류장 배열과 idx로 선택한 정류장 찾기
        selectedBusStop = self.buses?[idx]
        
        // csv에서 선택한 정류장 이름으로 해당 row 찾기
        if let selectedIdx = busIndex[selectedBusStop!]{
            row = selectedIdx
        }
        
        // 해당 row에서 정차하는 버스의 수, 버스종류 찾기
        print("버스의 수: \(self.busNum[row])")
        print("버스의 종류: ")
        for i in 0..<self.busNum[row]{
            print(self.busList[row][i])
        }
           
        return self.busList[row]
    }
}


