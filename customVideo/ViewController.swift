//
//  ViewController.swift
//  customVideo
//
//  Created by Nguyen Duc Tai on 5/23/18.
//  Copyright © 2018 Nguyen Duc Tai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let videoPlayerView = VideoPlayerView()
//        view.bringSubview(toFront: videoPlayerView.pauseButton)
    }

    
    @IBAction func pressedBtn(_ sender: Any) {
        let videoLaucher = VideoLauncher()
        videoLaucher.showVideoPlayer()
    }
    

}

