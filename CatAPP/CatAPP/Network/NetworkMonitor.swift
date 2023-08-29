//
//  NetworkMonitor.swift
//  CatAPP
//
//  Created by Moises Lopez on 29/08/23.
//

import Foundation
import Network
class NetworkMonitor: ObservableObject {
    @Published var isConnected = false
    private let monitor: NWPathMonitor
    private let queue: DispatchQueue
    init(
        monitor: NWPathMonitor,
        queue: DispatchQueue
    ) {
        self.monitor = monitor
        self.queue = queue
    }
    convenience init() {
        self.init(
            monitor: .init(),
            queue: .init(label: Constants.NetworkMonitorConstants.networkMonitor)
        )
        self.beginChecking()
    }
    private func beginChecking() {
        debugPrint(Constants.NetworkMonitorConstants.networkMonitor, #function)
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.pathHandler(path: path)
            }
        }
    }
    private func pathHandler(path: NWPath) {
        debugPrint(Constants.NetworkMonitorConstants.networkMonitorStatus, path.status)
        switch path.status {
        case .satisfied:
            isConnected = true
        default:
            isConnected = false
        }
    }
    deinit {
        debugPrint(Constants.NetworkMonitorConstants.networkMonitor, #function)
        monitor.cancel()
    }
}
#if DEBUG
extension NetworkMonitor {
    convenience init(isConnected: Bool) {
        self.init(
            monitor: .init(),
            queue: .init(label: Constants.NetworkMonitorConstants.networkMonitorMock)
        )
        self.isConnected = isConnected
    }
}
#endif
