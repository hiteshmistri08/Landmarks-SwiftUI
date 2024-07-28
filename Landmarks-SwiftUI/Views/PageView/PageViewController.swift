//
//  PageViewController.swift
//  Landmarks-SwiftUI
//
//  Created by Hitesh on 28/07/24.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIPageViewController // This is the UIKit Controller Type
    var pages: [Page]

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject {
        var parent: PageViewController
        
        init(parent: PageViewController) {
            self.parent = parent
        }
    }
}
