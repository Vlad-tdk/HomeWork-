//
//  Timer.swift
//  HomeWork#
//
//  Created by Vlad on 14.12.23..
//

import Combine
import Foundation

class TimeCounter: ObservableObject {
    var counter = 3
    var buttonTitle = "Start"
    let objectWillChange = ObservableObjectPublisher()
    
    private var timer: Timer?
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector:#selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        
        buttonDidTapped()
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        
        objectWillChange.send()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
            
        objectWillChange.send()
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
