//
//  ContentView.swift
//  DemoProject2
//
//  Created by 이종원 on 10/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                NavigationLink(destination: BasicView(), label: {
                    Text("BasicView")
                        .font(.largeTitle)
                })
                NavigationLink(destination: StackFrameView(), label: {
                    Text("StackFrameView")
                        .font(.largeTitle)
                })
                NavigationLink(destination: StateView(), label: {
                    Text("StateView")
                        .font(.largeTitle)
                })
                NavigationLink(destination: ConcurrencyView(), label: {
                    Text("ConcurrencyView")
                        .font(.largeTitle)
                })
                NavigationLink(destination: AppStorageView(), label: {
                    Text("AppStorageView")
                        .font(.largeTitle)
                })
                NavigationLink(destination: StorageNavigationView(), label: {
                    Text("StorageNavigationView")
                        .font(.largeTitle)
                })
                NavigationLink(destination: AlignmentView(), label: {
                    Text("AlignmentView")
                        .font(.largeTitle)
                })
                NavigationLink(destination: ListNavDemoView(), label: {
                    Text("ListNavDemoView")
                        .font(.largeTitle)
                })
                NavigationLink(destination: PhotoPickerSampleView(), label: {
                    Text("PhotoPickerSampleView")
                        .font(.largeTitle)
                })
            }
            .padding()
            .background(.teal)
        }
    }
}

#Preview {
    ContentView()
}
