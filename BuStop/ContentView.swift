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
    @ObservedObject private var notiManager = NotificationManager()
    
    var body: some View {
       
       Button("Alarm"){
           print("Press")
           notiManager.requestNotificationAuthorization()
           notiManager.sendNotification(seconds: 1, place: "ulsan")
       }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
