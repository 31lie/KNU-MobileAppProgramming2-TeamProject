//
//  NotificationManager.swift
//  BuStop
//
//  Created by 박휘성 on 2022/05/24.
//  https://developer.apple.com/forums/thread/653737

import SwiftUI
import UserNotifications
import AVFoundation

class NotificationManager: UIViewController, ObservableObject {
    
    let userNotificationCenter = UNUserNotificationCenter.current()

    let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        requestNotificationAuthorization()
    }

    func requestNotificationAuthorization() {
//        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
//
//        print("auth ok")
//        userNotificationCenter.requestAuthorization(options: authOptions) { success, error in
//            if let error = error {
//                print("Error: \(error)")
//            }
//        }
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow,Error in
                if didAllow {
                    print("Push: 권한 허용")
                } else {
                    print("Push: 권한 거부")
                }
            })
    }

    func sendNotification(seconds: Double, place: String) {
        
        print("OK")
        userNotificationCenter.removeAllPendingNotificationRequests()
        
        let notificationContent = UNMutableNotificationContent()

        notificationContent.title = "도착 알림"
        notificationContent.body = "경북대학교 정문 전 정류장 도착"
        
        let location_name = "경북대학교 정문"
        
        let utterance = AVSpeechUtterance(string: "이번 정류장은    " + location_name + "    입니다. ")
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.35
        //synthesizer.speak(utterance)

        SpeechService.shared.speak(text: "이번 정류장은    " + location_name + "    입니다. ") {
            
        }
        //let center = CLLocationCoordinate2D(latitude: )
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: "testNotification",
                                            content: notificationContent,
                                            trigger: trigger)

        userNotificationCenter.add(request) { error in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
    
}
