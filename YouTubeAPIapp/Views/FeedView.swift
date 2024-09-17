//
//  FeedView.swift
//  YouTubeAPIapp
//
//  Created by Fatmanur Şahin on 16.09.2024.
//

import SwiftUI

struct FeedView: View {
    
    @State private var videos: [Video] = []
    @State private var selectedVideo: Video?
    
    var body: some View {
        
        List(videos) { v in
            VideoRowView(video: v)
                .onTapGesture {
                    selectedVideo = v
                }
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .padding(.horizontal)
            .task {
                self.videos = await DataService().getVideo()
            }
            .sheet(item: $selectedVideo) { v in
                VideoDetailView(video: v)
            }
    }
}

#Preview {
    FeedView()
}
