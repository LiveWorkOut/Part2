//
//  InstructorsView.swift
//  LiveWorkOut
//
//  Created by Md Shahedur Rahman on 4/20/24.
//

import SwiftUI

struct Instructor: Identifiable {
    var id = UUID()
    var fullName: String
    var type: String
    var scheduleCount: Int
    var followersCount: Int
}

struct InstructorsView: View {
    @State private var searchText = ""
    @State private var instructors: [Instructor] = []
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
                .padding()
            
            ScrollView {
                LazyVStack(spacing: 1) {
                        ForEach(instructors, id: \.id) { instructor in
                            InstructorWindow(instructor: instructor)
                                .padding()
                        }
                    }
            }
            
            Spacer()
        }
        .onAppear {
            // Fetch instructors from Firebase
            fetchInstructors()
        }
    }
    
    private func fetchInstructors() {
        // Simulated fetching instructors data from Firebase
        
        // Dummy data for demonstration
        instructors = [
            Instructor(fullName: "John Doe", type: "Yoga", scheduleCount: 5, followersCount: 100),
            Instructor(fullName: "Jane Smith", type: "Pilates", scheduleCount: 3, followersCount: 80),
            Instructor(fullName: "Michael Johnson", type: "CrossFit", scheduleCount: 7, followersCount: 120)
        ]
    }
}

struct InstructorWindow: View {
    let instructor: Instructor
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(instructor.fullName)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top)
                
                HStack {
                    Text("Type:")
                        .foregroundColor(.gray)
                    Text(instructor.type)
                        .foregroundColor(.black)
                    Spacer()
                    Button(action: {}) {
                        Text("Create Schedule")
                            .foregroundColor(.blue)
                            .font(.subheadline)
                    }
                }
                
                HStack {
                    Text("Created:")
                        .foregroundColor(.gray)
                    Text("\(instructor.scheduleCount)")
                        .foregroundColor(.black)
                    Spacer()
                    Text("Followers:")
                        .foregroundColor(.gray)
                    Text("\(instructor.followersCount)")
                        .foregroundColor(.black)
                    Spacer()
                    Button(action: {}) {
                        Text("Follow")
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding()
            .shadow(radius: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
            )
            
            Spacer()
        }
    }
}



struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading)
            
            TextField("Search Instructor", text: $text)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .padding(.trailing)
        }
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct InstructorsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructorsView()
    }
}
