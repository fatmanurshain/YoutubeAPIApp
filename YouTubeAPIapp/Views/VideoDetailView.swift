//
//  VideoDetailView.swift
//  YouTubeAPIapp
//
//  Created by Fatmanur Şahin on 16.09.2024.
//

import SwiftUI
import YouTubePlayerKit

struct VideoDetailView: View {
    var video: Video
    var body: some View {
        
        GeometryReader { proxy in
            VStack (alignment: .leading) {
                // Configure Video Player
                let youTubePlayer = YouTubePlayer(
                    source: .video(id: video.snippet?.resourceId?.videoId ?? ""),
                    configuration: .init(
                        autoPlay: true
                    )
                )
                
                // Video Player
                YouTubePlayerView(youTubePlayer)
                    .frame(width: proxy.size.width, height: proxy.size.width/1.77778)
                
                // Title and Description
                ScrollView {
                    VStack(alignment: .leading, spacing: 30) {
                        Text(video.snippet?.title ?? "")
                            .font(.headline)
                            .bold()
                        
                        Text(video.snippet?.description ?? "")
                    }
                }
                .scrollIndicators(.hidden)
                .padding()
            }
        }
       
    }
}


