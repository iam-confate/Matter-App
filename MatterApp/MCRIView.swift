//
//  MCRIView.swift
//  MatterApp
//
//  Created by Confate Muleya  on 15/12/2025.
//

import SwiftUI

struct MatterCareerInstituteView: View {
    // Placeholder data for the long description
    let mcriDescription = """
    Matter Career Readiness Institute (MCRI) is dedicated to equipping individuals
    with the essential skills and knowledge required to succeed in today's
    dynamic job market. Our programs focus on practical, real-world applications
    and include comprehensive training in various career fields. We offer courses
    in leadership, technology, communication, and specialized trade skills.

    Our mission is to bridge the gap between education and employment by providing
    intensive, career-focused instruction. Graduates from MCRI are highly sought
    after by employers due to their proven competence and readiness. Our faculty
    are industry experts who bring current, relevant experience into the classroom,
    ensuring that our curriculum remains cutting-edge and aligned with industry
    demands.

    Key Program Features:
    - Hands-on workshops and practical exercises.
    - Personalized career counseling and job placement assistance.
    - Certifications recognized across the industry.
    - Flexible scheduling options for working professionals.

    Join the Matter Career Readiness Institute community and take the next step
    towards achieving your professional goals and securing a successful future.
    """

    var body: some View {
        NavigationStack {
            // The ScrollView now contains ALL content below the navigation bar
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // 1. Image Section (Orange Placeholder)
                    Image("MCRI")
                        .resizable()
                        .frame(height: 250)
                        .padding([.horizontal, .top]) // Padding on sides and top of the image
                        .padding(.bottom, 20) // Separator space before the text

                    // 2. Content Section
                    VStack(alignment: .leading, spacing: 15) {
                        Text("About the Institute")
                            .font(.title2)
                            .fontWeight(.bold)

                        // Main Description Text
                        Text(mcriDescription)
                            .font(.body)
                            .foregroundColor(.black)
                            .lineSpacing(4)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20) // Padding at the end of the scrollable content
                }
            }
            // Set the navigation title
            .navigationTitle("Matter Career Readiness Institute")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MatterCareerInstituteView()
}
