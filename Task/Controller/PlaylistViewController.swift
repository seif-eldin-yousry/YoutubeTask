//
//  PlaylistViewController.swift
//  Task
//
//  Created by Seif Yousry on 3/26/20.
//  Copyright © 2020 Seif Yousry. All rights reserved.
//


import UIKit

class PlaylistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //    @IBOutlet weak var myWebView: UIWebView!
    
    
    var videos:[Video] = []
    var video:Video = Video()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        getVideo(videoCode: "M7lc1UVf-VE")
        
        let video = Video()
        video.key = "M7lc1UVf-VE"
        video.title = "asdads"
        videos.append(video)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell
        
        cell.videoTitle.text = videos[indexPath.row].title
        let url = "https://img.youtube.com/vi/\(videos[indexPath.row].key)/0.jpg"
        cell.videoImage.downloaded(from: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vi = videos[indexPath.row]
        self.video = vi
        
        performSegue(withIdentifier: "toVideo", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toVideo" {
            
            let vc = segue.destination as! VideoViewController
            vc.video = self.video
            
        }
    }
    
}


//class Video {
//    var key: String = ""
//    var title: String = ""
//}

extension UIImageView {
    func downloadedVideo (from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
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
    
    func downloadedVideo (from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
        
    }
    
}

