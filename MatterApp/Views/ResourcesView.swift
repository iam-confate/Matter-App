//
//  ResourcesView.swift
//  MatterApp
//
//  Created by Confate Muleya  on 15/12/2025.
//

import SwiftUI

import SwiftUI

struct AboutPage: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("What is Matter Hub?")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("""
MATTER Projects showcase community-driven initiatives designed to empower youth, strengthen livelihoods, and create lasting social impact. Through innovative programs like the MCRI, MATTER brings together partners, mentors, and learners to turn opportunity into real-world change.

This app is built to make that impact visible and accessible,providing a centralized space where communities, partners, and supporters can discover MATTER’s projects, track progress,and understand the real outcomes behind the work.                           
""")
                        .font(.body)
                        .lineSpacing(4)
                    }
                    .padding(.horizontal)
                    
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Our Mission")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Empower every voice, align every team. Project Pulse brings structure to collaboration, giving every MATTER stakeholder, student, facilitator, managers, and donors,a clear view of progress, so together we can build futures faster.")
                            .font(.body)
                            .lineSpacing(4)
                    }
                    .padding(.horizontal)
                    
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Contact us")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 12) {
                                Image(systemName: "envelope.fill")
                                    .frame(width: 24)
                                Text("info@matter.org")
                            }
                            
                            HStack(spacing: 12) {
                                Image(systemName: "phone.fill")
                                    .tint(Color.Orange)
                                    .frame(width: 24)
                                Text("+1 201-500-2345")
                                    .font(.headline)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Legal & Privacy")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 12) {
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(.blue)
                                    .frame(width: 24)
                                Text("Privacy Policy")
                                    .font(.headline)
                            }
                            
                            HStack(spacing: 12) {
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(.blue)
                                    .frame(width: 24)
                                Text("Terms of Service")
                                    .font(.headline)
                            }
                            
                            HStack(spacing: 12) {
                                Image(systemName: "lock.shield.fill")
                                    .foregroundColor(.blue)
                                    .frame(width: 24)
                                Text("Data Protection")
                                    .font(.headline)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Acknowledgements")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("""
                        The Matter App was inspired by MATTER's mission and built for everyone involved in their programs. We thank the students, facilitators, managers, and donors who shared their stories, and our team who brought this vision to life.
                        
                        Special thanks to the MCRI community for showing us what's possible when communication becomes clarity.
                        """)
                        .font(.body)
                        .lineSpacing(4)
                        
                        Text("Version 1.0.0")
                            .font(.headline)
                            .offset(x: 120, y: 0)
                            .fontWeight(.bold)
                        
                    }
                    
                    
                    .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 20)
                }
                .padding(.vertical)
            }
            .navigationTitle("About")
        }
    }
}

#Preview {
    AboutPage()
}

