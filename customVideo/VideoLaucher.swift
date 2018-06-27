//
//  File.swift
//  customVideo
//
//  Created by Nguyen Duc Tai on 5/23/18.
//  Copyright © 2018 Nguyen Duc Tai. All rights reserved.
//

import UIKit
import AVFoundation
class VideoPlayerView: UIView {
    let controlsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 1)
        return view
    }()
    
    let pauseButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "pause")
        button.setImage(image, for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        controlsContainerView.frame = frame
        addSubview(controlsContainerView)
        // Add button to view
       
        backgroundColor = UIColor.black
        
//        let urlString = "https://www.youtube.com/watch?v=kTlv5_Bs8aw"
        
        setupPlayerView()
        
        controlsContainerView.addSubview(pauseButton)
        pauseButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pauseButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pauseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pauseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        controlsContainerView.bringSubview(toFront: pauseButton)
        
    }
    
    private func setupPlayerView() {
        let urlS = "https://firebasestorage.googleapis.com/v0/b/instagramclone-197b0.appspot.com/o/Video%20Of%20People%20Walking.mp4?alt=media&token=871048fe-3a3a-4240-8ed5-82683141ccb7"
        if let url = URL(string: urlS) {
            let player = AVPlayer(url: url)
            player.isMuted = true
        
            
            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = self.frame
            
            player.play()
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}

class VideoLauncher: NSObject {
    

    
    func showVideoPlayer() {
        
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = UIColor.white
            
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height, width: 10, height: 10)
            
//            create hd video (16*9)
            let height = keyWindow.frame.width*9/16
//            let videoPlayerFrame = CGRect(x: 0, y: 100, width: keyWindow.frame.width, height: height)
//            let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
//            view.addSubview(videoPlayerView)
            
            let videoPlace = UIView(frame: CGRect(x: 0, y: 100, width: keyWindow.frame.width, height: height))
            view.addSubview(videoPlace)
            videoPlace.backgroundColor = .red
            //let videoPlayerFrame = CGRect(x: 0, y: 100, width: keyWindow.frame.width, height: height)
            let videoPlayerView = VideoPlayerView(frame: videoPlace.bounds)
            
            videoPlace.addSubview(videoPlayerView)
          
//
            
//
            keyWindow.addSubview(view)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions.curveEaseOut, animations: {
                view.frame = keyWindow.frame
            }) { (complete) in
                
            }
        }
    }
}
