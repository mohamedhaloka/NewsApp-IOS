//
//  ContentView.swift
//  H4X0R
//
//  Created by Mohamed Nasr on 29/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var networkManager  = NetworkManager()
    
    var body: some View {
        NavigationView{
            if(self.networkManager.loading == true)
               {
                ActivityIndicator(isAnimating: true)
            }
            else
               { List(networkManager.postsData) { post in
                NavigationLink(destination: DetailsView(urlString: post.url)){
                    Text(post.title)
                }
            }.navigationBarTitle("H4XOR")}
        }.onAppear {
            self.networkManager.fetchData();
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ActivityIndicator: UIViewRepresentable {
    
    typealias UIView = UIActivityIndicatorView
    var isAnimating: Bool
    fileprivate var configuration = { (indicator: UIView) in }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView { UIView() }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}
