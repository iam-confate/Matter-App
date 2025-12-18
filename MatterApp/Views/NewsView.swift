//
//  NewsView.swift
//  MatterApp
//
//  Created by Confate Muleya  on 15/12/2025.
//

import SwiftUI


let sampleNotifications: [NotificationItem] = [
    NotificationItem(
        title: "New Job Alert!",
        message: "Matter just posted an opening for Senior Developers in our NYC branch. Check it out!",
        linkedInURL: URL(string: "https://www.linkedin.com/feed/update/matter-job-alert-1")!
    ),
    NotificationItem(
        title: "Webinar Tonight",
        message: "Join our CEO's live Q&A session on 'Future of AI in Fintech' at 7 PM EST.",
        linkedInURL: URL(string: "https://www.linkedin.com/feed/update/matter-webinar-2")!
    ),
    NotificationItem(
        title: "New Course Launched",
        message: "Enrollment is now open for our 'Advanced Data Science' certification course.",
        linkedInURL: URL(string: "https://www.linkedin.com/feed/update/matter-course-launch-3")!
    ),
    NotificationItem(
        title: "Company Anniversary",
        message: "Celebrate our 10th year! See photos from the party and read our history.",
        linkedInURL: URL(string: "https://www.linkedin.com/feed/update/matter-anniversary-4")!
    )
]

struct MatterNotificationsView: View {
    let notifications = sampleNotifications

    var body: some View {
        NavigationStack {
          
            List {
                ForEach(notifications) { notification in
                  
                    Link(destination: notification.linkedInURL) {
                        NotificationRowView(notification: notification)
                    }
                  
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Matter Accounts Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NotificationRowView: View {
    let notification: NotificationItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
              
                Image(systemName: "link")
                   
                    .foregroundColor(.orange)
                    .font(.headline)

                Text(notification.title)
                    .font(.headline)
                    .foregroundColor(.primary)
            }

            Text(notification.message)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)

            HStack {
                Spacer()
                Text("View on LinkedIn")
                    .font(.caption)
                  
                    .foregroundColor(Color.Orange)
            }
        }
        .padding()
    
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
        .padding(.vertical, 4)
    }
}


#Preview {
    MatterNotificationsView()
}
