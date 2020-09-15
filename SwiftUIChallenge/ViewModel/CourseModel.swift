//
//  CourseModel.swift
//  SwiftUIChallenge
//
//  Created by LW on 15/9/20.
//

import Combine
import Foundation

let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"

class CoursesViewModel: ObservableObject {
    @Published var message = ""

    var bag = Set<AnyCancellable>()

    @Published var courses: [Course] = [
        .init(name: "List Placeholder", bannerUrl: "http://www.google.com"),
    ]

    func fetchCourses() {
        courses = []
        guard let url = URL(string: apiUrl) else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .map {
                $0.data
            }
            .decode(type: [Course].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .print()
            .eraseToAnyPublisher()
            .sink(receiveValue: { posts in
                self.courses = posts
            })
            .store(in: &bag)
    }
}
