//
//  Delay.swift
//  Reminders
//
//  Created by Denys Zaiakin on 02.04.2024.
//

import Foundation

class Delay {
    private var seconds: Double

    var workItem: DispatchWorkItem?

    init(seconds: Double = 2) {
        self.seconds = seconds
    }

    func performWork(_ work: @escaping () -> Void) {
        workItem = DispatchWorkItem(block: {
            work()
        })

        guard let workItem else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: workItem)
    }

    func cancel() {
        workItem?.cancel()
    }
}
