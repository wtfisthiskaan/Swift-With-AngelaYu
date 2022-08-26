//
//  DetailView.swift
//  H4X0R News
//
//  Created by Kaan Uslu on 26.08.2022.
//

import SwiftUI
import WebKit
struct DetailView: View {
    let url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}


