//
//  NotificationItem.swift
//  MatterApp
//
//  Created by Confate Muleya  on 18/12/2025.
//

import SwiftUI

struct NotificationItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let linkedInURL: URL
}
