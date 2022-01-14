import Foundation
import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    
    var urlString : String?
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if(urlString != nil)
        {
            let urlString = URL(string: urlString!)
            
            let request = URLRequest(url: urlString!)
            
            uiView.load(request)
        }
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
}
