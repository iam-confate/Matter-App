//
//  HomeView.swift
//  MatterApp
//
//  Created by Confate Muleya  on 15/12/2025.
//

import SwiftUI
internal import Combine


struct HomeView: View {
    let quickActions: [(title: String, icon: String)] = [
        ("MCRI", "building.columns"),
        ("Partners", "person.circle.fill"),
        ("FAQs", "questionmark.circle"),
        ("About The App", "info.circle.fill")
    ]
    
    let images: [String] = [
        "ban1", "ban2", "ban3", "ban4", "ban5", "ban6",
        "ban7", "ban8", "ban9", "ban10", "ban11", "ban12",
        "ban13", "ban14", "ban15"
    ]
    
    @State private var currentIndex: Int = 0
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var currentDateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeZone = TimeZone(identifier: "Africa/Harare")
        return formatter.string(from: Date())
    }
    
    var customTitleView: some View {
        VStack(alignment: .leading) {
            Text("Home DashBoard")
                .font(.title)
                .fontWeight(.bold)
            
            Text(currentDateString)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .offset(x: -70)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 20) {
                        TabView(selection: $currentIndex) {
                            ForEach(images.indices, id: \.self) { index in
                                Image(images[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .tag(index)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        .frame(height: 200)
                        .padding(.top, 5)
                        .onReceive(timer) { _ in
                            withAnimation {
                                currentIndex = (currentIndex + 1) % images.count
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Quick Actions")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 5)
                        
                        Spacer()
                            .frame(height: 20)
                        
                        LazyVGrid(columns: gridColumns, spacing: 20) {
                            ForEach(quickActions.indices, id: \.self) { index in
                                let action = quickActions[index]
                                NavigationLink {
                                    switch action.title {
                                    case "MCRI":
                                        MatterCareerInstituteView()
                                    case "Partners":
                                        PartnersView()
                                    case "FAQs":
                                        FAQsView()
                                    case "About The App":
                                        AboutPage()
                                    default:
                                        DetailView(title: action.title)
                                    }
                                } label: {
                                    VStack(spacing: 8) {
                                        Image(systemName: action.icon)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: index == 0 ? 40 : 30, height: 30)
                                            .foregroundColor(.white)
                                        Text(action.title)
                                            .font(.caption)
                                            .fontWeight(.medium)
                                            .foregroundColor(.white)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 100)
                                    .background(Color(red: 236/255, green: 137/255, blue: 37/255))
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    }
                    .padding(.vertical)
                }
                
                HStack(spacing: 0) {
                    NavigationLink {
                        Text("Home View")
                    } label: {
                        FooterButtonWithLabel(icon: "house.fill", label: "Home", isActive: true)
                    }
                    .frame(maxWidth: .infinity)
                    
                    NavigationLink {
                        MatterNotificationsView()
                    } label: {
                        VStack(spacing: 4) {
                            Image(systemName: "bell.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                                .padding(20)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                                .offset(y: -25)
                            Text("News")
                                .font(.caption2)
                                .foregroundColor(.black)
                                .offset(y: -5)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    NavigationLink {
                        SettingsView()
                    } label: {
                        FooterButtonWithLabel(icon: "gearshape.fill", label: "Settings")
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(height: 50)
                .background(Color.white.ignoresSafeArea(edges: .bottom))
                .shadow(radius: 1)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    customTitleView
                }
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}


struct FooterButtonWithLabel: View {
    var icon: String
    var label: String
    var isActive: Bool = false
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(isActive ? Color(red: 236/255, green: 137/255, blue: 37/255) : .black)
            Text(label)
                .font(.caption2)
                .foregroundColor(isActive ? Color(red: 236/255, green: 137/255, blue: 37/255) : .black)
        }
    }
}

struct DetailView: View {
    let title: String
    var body: some View {
        Text("Detail View for \(title)")
            .font(.largeTitle)
            .fontWeight(.bold)
            .navigationTitle(title)
    }
}
#Preview {
    HomeView()
}
