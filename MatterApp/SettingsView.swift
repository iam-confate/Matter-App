//
//  SettingsView.swift
//  MatterApp
//
//  Created by Confate Muleya  on 15/12/2025.
//

import SwiftUI

extension Color {
  
    static let customOrange = Color(red: 236/255, green: 137/255, blue: 37/255)
}

struct SettingsView: View {

    @AppStorage("isDarkMode") private var darkModeEnabled = false
    @AppStorage("appLanguageCode") private var selectedLanguageCode: String = "en"

    @State private var notificationsEnabled = true
    @State private var autoSyncEnabled = true
    @State private var preferredRoleDisplay = "Project Manager"
    @State private var showConfirmLogout = false
    @State private var cacheSize = "245 MB"
    @State private var showClearCacheAlert = false

    let availableRoles = ["Student", "Facilitator", "Project Manager", "Donor", "Intern"]
    let availableLanguages = [
        ("English", "en"),
        ("French", "fr"),
        ("Zulu", "zu"),
        ("Shona", "sn")
    ]
    
    private func clearCache() {
        cacheSize = "0 MB"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.cacheSize = "42 KB"
        }
    }

    private var dashboardDisplaySection: some View {
        Section(header: Text("Theme & Display").foregroundColor(.customOrange)) {
            
            Toggle(isOn: $notificationsEnabled) {
                SettingsIconRow(icon: "bell.badge.fill", title: "Enable Notifications", iconColor: .customOrange)
            }
            .tint(.orange)
            
            Picker(selection: $selectedLanguageCode) {
                ForEach(availableLanguages, id: \.1) { (name, code) in
                    Text(name).tag(code)
                }
            } label: {
                SettingsIconRow(icon: "globe", title: "App Language", subtitle: availableLanguages.first(where: { $0.1 == selectedLanguageCode })?.0, iconColor: .customOrange)
            }
            
            Toggle(isOn: $darkModeEnabled) {
                SettingsIconRow(icon: "moon.fill", title: "Dark Mode", iconColor: .customOrange)
            }
            .tint(.customOrange)
        }
    }

    private var dataSyncSection: some View {
        Section(header: Text("Data & Synchronization").foregroundColor(.customOrange)) {
            
            Toggle(isOn: $autoSyncEnabled) {
                SettingsIconRow(icon: "arrow.triangle.2.circlepath", title: "Auto-Sync Data", iconColor: .customOrange)
            }
            .tint(.customOrange)
            
            Button(action: { showClearCacheAlert = true }) {
                
                HStack {
                    SettingsIconRow(icon: "trash.fill", title: "Clear Local Cache", subtitle: "Currently \(cacheSize)", iconColor: .red)
                    Spacer()
                }
            }
            .foregroundColor(.primary)
        }
    }

    private var supportInfoSection: some View {
        Group {
            Section(header: Text("Support").foregroundColor(.customOrange)) {
                
                NavigationLink(destination: FAQsView()) {
                    SettingsIconRow(icon: "questionmark.circle.fill", title: "Help Center & FAQ", iconColor: .customOrange)
                }
                
            }
            
            HStack {
                Spacer()
                VStack {
                    Text("Facilitator Dashboard v1.0.0")
                    Text("© 2025 Matter Hub")
                }
                .font(.caption2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.vertical, 20)
                Spacer()
            }
            .listRowBackground(Color.clear)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                dashboardDisplaySection
                dataSyncSection
                supportInfoSection
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.customOrange)
                }
            }
            .alert("Log Out", isPresented: $showConfirmLogout) {
                Button("Cancel", role: .cancel) { }
                Button("Log Out", role: .destructive) {
                    // Log out action
                }
            } message: {
                Text("Are you sure you want to log out of your account?")
            }
            .alert("Clear Cache", isPresented: $showClearCacheAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Clear \(cacheSize)", role: .destructive) {
                    clearCache()
                }
            } message: {
                Text("This will remove all temporary data and free up storage.")
            }
        }
        .tint(.orange)
        .preferredColorScheme(darkModeEnabled ? .dark : .light)
    }
}


struct SettingsIconRow: View {
    let icon: String
    let title: String
    var subtitle: String? = nil
    let iconColor: Color
    
    var body: some View {
        HStack(spacing: 15) {
            
            Image(systemName: icon)
                .font(.system(size: 16, weight: .regular))
                .frame(width: 28, height: 28)
                .background(iconColor.opacity(0.15))
                .foregroundColor(iconColor)
                .cornerRadius(6)
            
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.body)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
