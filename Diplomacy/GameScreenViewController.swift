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
    
//    var game : PFObject = 
//    var gameBoard : PFObject = PFObject(className: "Board")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.minimumZoomScale = 0.5
        self.scrollView.maximumZoomScale = 10.0
        self.scrollView.canCancelContentTouches = false
        getGameBoard()
    }
    
    func getGameBoard() {
//        var query = PFQuery(className:"Board")
//        var gameBoardId : String
//        if (game["board"] != nil) {
//            gameBoardId = game["board"]["objectId"] as String
//        }
//        println(gameBoardId)
//        query.whereKey("objectId", equalTo: gameBoardId)
//        println(game)
//        query.findObjectsInBackgroundWithBlock {
//            (objects: [AnyObject]!, error: NSError!) -> Void in
//            if error == nil {
//                // The find succeeded.
//                // Do something with the found objects
//                if (objects.count != 0) {
//                    self.gameBoard = objects[0] as PFObject
//                } else {
//                    println("board not found")
//                }
//
//                println(self.gameBoard)
//            } else {
//                // Log details of the failure
//                NSLog("Error: %@ %@", error, error.userInfo!)
//            }
//        }
    }

    
//    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//        var touch : UITouch! = touches.anyObject()?.anyObject as UITouch
//        var location = touch.locationInView(self.view)
//        println("touched")
//    }
//    
//    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
//        println("touched")
//    }
//    
//    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
//        println("touched")
//    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

}
