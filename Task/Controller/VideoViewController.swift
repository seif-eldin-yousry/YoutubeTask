//
//  VideoViewController.swift
//  Task
//
//  Created by Seif Yousry on 3/26/20.
//  Copyright © 2020 Seif Yousry. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    
    var video:Video = Video()
    
    @IBOutlet weak var videoWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getVideo(videoKey: "M7lc1UVf-VE")
        // Do any additional setup after loading the view.
    }
    
    func getVideo(videoKey: String){
        //        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        
        guard let feedUrl = URL(string: "https://www.youtube.com/embed/\(videoKey)") else { return }
        videoWebView.loadRequest(URLRequest(url: feedUrl))
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
