//
//  ContentView.swift
//  SwiftUIChallenge
//
//  Created by LW on 15/9/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var coursesVM = CoursesViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(coursesVM.courses) { course in
                    NavigationLink(course.name, destination: Link("Open Link",
                                                                  destination: URL(string: course.bannerUrl)!))
                }
            }
            .navigationBarTitle("Course")
            .navigationBarItems(trailing: Button(action: {
                coursesVM.fetchCourses()
            }, label: {
                Text("Fetching Courses")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
