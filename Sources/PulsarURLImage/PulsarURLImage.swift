//
//  PulsarURLImage.swift
//  PulsarUI
//
//  Created by Orszagh Sandor on 2022. 04. 28..
//

import SwiftUI

/// Pulsar URLImage Component Download an Image from web and show in SwiftUI
///
///
///        PulsarURLImage(url: "https://a.cdn-hotels.com/image.jpg")
///
///



public struct PulsarURLImage:View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    
    public init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    public var body: some View {
      
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
        } else {
            return Image("placeholder", bundle: .module).resizable()
        }
        
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        PulsarURLImage(url: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg")
    }
}
