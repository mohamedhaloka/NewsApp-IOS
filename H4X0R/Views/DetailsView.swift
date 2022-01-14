//
//  DetailsView.swift
//  H4X0R
//
//  Created by Mohamed Nasr on 29/11/2021.
//

import SwiftUI
import WebKit

struct DetailsView: View {
    var urlString : String?
    var body: some View {
        WebView(urlString: urlString)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(urlString: "")
    }
}




