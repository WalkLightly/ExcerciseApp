import Foundation
internal import Combine

class Stopwatch: ObservableObject {
    @Published var counter: Double = 0.0
    @Published var isRunning: Bool = false
    
    private var timer: Timer?
    
    func start() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.counter += 0.01
        }
        
        if let activeTimer = self.timer {
            RunLoop.current.add(activeTimer, forMode: .common)
        }
    }
    
    func pause() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    func reset() {
        pause()
        counter = 0.0
    }
}
