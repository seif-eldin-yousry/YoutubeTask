//
//  ViewController.swift
//  Task
//
//  Created by Seif Yousry on 3/26/20.
//  Copyright © 2020 Seif Yousry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
    
    var channel = [Video]()
    var video:Video = Video()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let video1 = Video()
        video1.key = "M7lc1UVf-VE"
        video1.title = "First"
        channel.append(video1)
        
        let video2 = Video()
        video2.key = "M7lc1UVf-VE"
        video2.title = "Second"
        channel.append(video2)
        
        let video3 = Video()
        video3.key = "M7lc1UVf-VE"
        video3.title = "Third"
        channel.append(video3)
        
    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChannelTableViewCell
        
        cell.channelTitle.text = channel[indexPath.row].title
        let url = "https://img.youtube.com/vi/\(channel[indexPath.row].key)/0.jpg"
        cell.channelImage.downloaded(from: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vi = channel[indexPath.row]
        self.channel = [vi]
        
        performSegue(withIdentifier: "toPlaylist", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlaylist" {
            
            let vc = segue.destination as! PlaylistViewController
            vc.video = self.video
            
        }
    }
}




extension UIImageView {
    func downloaded (from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpUrlResponse = response as? HTTPURLResponse, httpUrlResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            
            DispatchQueue.main.async {
                self.image = image
            }
            
            }.resume()
        
    }
    
    func downloaded (from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
        
    }
    
}
