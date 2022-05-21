//
//  BusStopInfo.swift
//  BuStop
//
//  Created by geun on 2022/05/19.
//

//버스정류장 정보 불러온 후 현재위치 n미터 이내 정류장이름을 String배열로 불러옮. 그리고 console에 출력

//let busstop = BusStopInfo(filePath: "/Users/geun/Desktop/input.csv")
//
//let listOfBusStop: [String] = busstop.FindBusStop(n)
//for i in 0..<listOfBusStop.count{
//    print(listOfBusStop[i])
//}


import Foundation
import CSV
import CoreLocation
//CSV.swift패키지 필요, 혹시 오류나면 패키지추가하는법 알려드릴테니까 톡주세요 https://github.com/yaslab/CSV.swift.git by김동근

//대구 시내 정류장정보를 가지고 있음
public class BusStopInfo{
//    정류소아이디[0],모바일아이디[1],정류소명[2],영문명[3],시도[4],구군[5],동[6],경도[7],위도[8],경유노선수[9],경유노선[10]
    var name:[String] = []          //정류장 이름
    var longitude:[String] = []     //정류장 경도
    var latitude:[String] = []      //정류장 위도
    var busNum:[String] = []        //해당 정류장 정차버스 수
    var busList:[[String]] = [[]]   //해당 정류장 버스 종류
    var sizeOfArray = 0             //총 배열의 크기
    
    var busIndex = [String: Int]()  //key: 정류장 이름, value: 정류장에 해당하는 index. 위 배열에 사용
    
    //파일 경로 설정
    init(filePath: String){
        //csv파일 읽기
        let stream = InputStream(fileAtPath: filePath)!
        let csv = try! CSVReader(stream: stream)
        
        
        busList.removeAll()     //버그 발생 방지!
        //csv파일 정보  배열에 저장
        while let row = csv.next() {
            var bus: [String] = []
            
            name.append(row[2])
            longitude.append(row[7])
            latitude.append(row[8])
            busNum.append(row[9])
            
            for j in 10..<row.count{
                bus.append(row[j])
            }
            
            busList.append(bus)
            busIndex[row[2]] = sizeOfArray
            sizeOfArray += 1
        }
    }
    
    //inMeter내의 주변 버스정류장 찾기 함수
    func FindBusStop(_ inMeter: CLLocationDistance) -> [String]{
        let currentLocation: LocationInfo = LocationInfo()
        var bsLongtitue: Double
        var bsLatitude: Double
        var distance: CLLocationDistance
        var listOfBusStop: [String] = []
        
        currentLocation.viewDidLoad()
        
        
        for i in 1..<self.sizeOfArray{
            bsLongtitue = Double(self.longitude[i])!
            bsLatitude = Double(self.latitude[i])!
            distance = currentLocation.distance(latitude: bsLatitude, longitude: bsLongtitue)
            if distance <= inMeter{
                listOfBusStop.append(self.name[i])
            }
        }
        
        return listOfBusStop
    }
}



