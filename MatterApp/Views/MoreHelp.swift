//
//  MoreHelp.swift
//  MatterApp
//
//  Created by Confate Muleya  on 16/12/2025.
//

import SwiftUI

struct AskQuestionsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var customQuestion: String = ""
    
    func sendToGoogle() {
        guard !customQuestion.isEmpty,
              let encodedQuery = customQuestion.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://www.google.com/search?q=\(encodedQuery)") else {
            return
        }
        UIApplication.shared.open(url)
    }
    
    func sendToChatGPT() {
        guard !customQuestion.isEmpty else { return }
        
        if let url = URL(string: "https://chat.openai.com/") {
            UIApplication.shared.open(url)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                
                TextEditor(text: $customQuestion)
                    .frame(height: 180)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.Orange, lineWidth: 2)
                    )
                    .background(Color.white)
                    .autocorrectionDisabled(true)
                    .cornerRadius(15)
                    .overlay(
                        
                        Group {
                            if customQuestion.isEmpty {
                                Text("What is ?.........")
                                    .foregroundColor(Color(.systemGray3))
                                    .padding(.top, 18)
                                    .padding(.leading, 15)
                                    .allowsHitTesting(false)
                            }
                        }, alignment: .topLeading
                    )
                    .padding(.horizontal)
                
                
                Button(action: sendToGoogle) {
                    Text("Send to Google")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(customQuestion.isEmpty ? Color(.systemGray4) : Color.Orange)
                        .cornerRadius(10)
                }
                .disabled(customQuestion.isEmpty)
                .padding(.horizontal)
                
                
                Button(action: sendToChatGPT) {
                    Text("Send to ChatGPT")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(customQuestion.isEmpty ? Color(.systemGray4) : Color.Orange.opacity(0.8))
                        .cornerRadius(10)
                }
                .disabled(customQuestion.isEmpty)
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top, 20)
            .background(Color(.systemGray6).ignoresSafeArea())
            .navigationTitle("Ask Questions")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(Color.Orange)
                }
            }
        }
    }
}

#Preview {
    AskQuestionsView()
}
