//
//  VideoRowView.swift
//  YouTubeAPIapp
//
//  Created by Fatmanur Şahin on 16.09.2024.
//

import SwiftUI

struct VideoRowView: View {
    
    var video : Video
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if let url = URL(string: video.snippet?.thumbnails?.medium?.url ?? "")
            {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                    ProgressView()
                }
            }
            Text(video.snippet?.title ?? "")
                .bold()
        }
        .padding(.vertical)
    }
}
