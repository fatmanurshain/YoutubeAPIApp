//
//  DataService.swift
//  YouTubeAPIapp
//
//  Created by Fatmanur Şahin on 16.09.2024.
//

import Foundation

struct DataService{
    
    private let api_key = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getVideo() async -> [Video] {
        
        // Check if Api Key is there
        guard api_key != nil else {
            return [Video]()
        }
        
        // Create the url
        let urlString = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLMRqhzcHGw1Yw2XJyHnxoEXPBCdMaRzkf&maxResults=20&key=\(api_key!)"
        let url = URL(string: urlString)
        
        if let url = url {
            
            // Create the request
            let request = URLRequest(url: url)
            let session = URLSession.shared
            
            // Send the request
            do {
               let (data, _) = try await session.data(for: request)
                
                // Parse the data
                let decoder = JSONDecoder()
                let playlist = try decoder.decode(Playlist.self, from: data)
                
                return playlist.items
            }
            catch {
                print(error)
            }
        }
        return [Video]()
    }
}
