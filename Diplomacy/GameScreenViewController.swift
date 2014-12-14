//
//  GameScreenViewController.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 12/11/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation

class GameScreenViewController : UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    var game : Game!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.minimumZoomScale = 0.25
        self.scrollView.maximumZoomScale = 1.0
        self.scrollView.canCancelContentTouches = false
        placePieces()
    }
    

    func placePieces() {
        let image = UIImage(named: "british-army")
        let piece = UIImageView(frame: CGRect(x: 100, y: 100, width: 40, height: 40))
        piece.image = image
        self.containerView.addSubview(piece)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.containerView
    }

}
