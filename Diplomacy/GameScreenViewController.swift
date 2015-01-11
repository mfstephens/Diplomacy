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
    var provinces = Dictionary<String, CGPoint>()
    var selectedPiece : UIImageView!
    var isMovingPiece = false
    
    override func viewDidLoad() {
        provinces["Adriatic Sea"] = CGPoint(x: 1500, y: 800)
        provinces["Aegean Sea"] = CGPoint(x: 1000, y: 1000)
        provinces["Albania"] = CGPoint(x: 750, y: 950)
        provinces["Ankara"] = CGPoint(x: 1024, y: 1241)
        provinces["Apulia"] = CGPoint(x: 1242, y: 1245)
        provinces["Armenia"] = CGPoint(x: 800, y: 1234)
        provinces["Baltic Sea"] = CGPoint(x: 1234, y: 1322)
        provinces["Barents Sea"] = CGPoint(x: 100, y: 100)
        provinces["Belgium"] = CGPoint(x: 100, y: 100)
        provinces["Berlin"] = CGPoint(x: 100, y: 100)
        provinces["Black Sea"] = CGPoint(x: 100, y: 100)
        provinces["Bohemia"] = CGPoint(x: 100, y: 100)
        provinces["Brest"] = CGPoint(x: 100, y: 100)
        provinces["Budapest"] = CGPoint(x: 100, y: 100)
        provinces["Bulgaria"] = CGPoint(x: 100, y: 100)
        provinces["Burgundy"] = CGPoint(x: 100, y: 100)
        provinces["Clyde"] = CGPoint(x: 100, y: 100)
        provinces["Constantinople"] = CGPoint(x: 100, y: 100)
        provinces["Denmark"] = CGPoint(x: 100, y: 100)
        provinces["Eastern Mediterranean"] = CGPoint(x: 100, y: 100)
        provinces["Edinburgh"] = CGPoint(x: 100, y: 100)
        provinces["English Channel"] = CGPoint(x: 100, y: 100)
        provinces["Finland"] = CGPoint(x: 100, y: 100)
        provinces["Galicia"] = CGPoint(x: 100, y: 100)
        provinces["Gascony"] = CGPoint(x: 100, y: 100)
        provinces["Greece"] = CGPoint(x: 100, y: 100)
        provinces["Gulf of Lyon"] = CGPoint(x: 100, y: 100)
        provinces["Gulf of Bothnia"] = CGPoint(x: 100, y: 100)
        provinces["Helgoland Bight"] = CGPoint(x: 100, y: 100)
        provinces["Holland"] = CGPoint(x: 100, y: 100)
        provinces["Ionian Sea"] = CGPoint(x: 100, y: 100)
        provinces["Irish Sea"] = CGPoint(x: 100, y: 100)
        provinces["Kiel"] = CGPoint(x: 100, y: 100)
        provinces["Liverpool"] = CGPoint(x: 100, y: 100)
        provinces["Livonia"] = CGPoint(x: 100, y: 100)
        provinces["London"] = CGPoint(x: 100, y: 100)
        provinces["Marseilles"] = CGPoint(x: 100, y: 100)
        provinces["Mid-Atlantic Ocean"] = CGPoint(x: 100, y: 100)
        provinces["Moscow"] = CGPoint(x: 100, y: 100)
        provinces["Munich"] = CGPoint(x: 100, y: 100)
        provinces["Naples"] = CGPoint(x: 100, y: 100)
        provinces["North Atlantic Ocean"] = CGPoint(x: 100, y: 100)
        provinces["North Africa"] = CGPoint(x: 100, y: 100)
        provinces["North Sea"] = CGPoint(x: 100, y: 100)
        provinces["Norway"] = CGPoint(x: 100, y: 100)
        provinces["Norwegian Sea"] = CGPoint(x: 100, y: 100)
        provinces["Paris"] = CGPoint(x: 100, y: 100)
        provinces["Picardy"] = CGPoint(x: 100, y: 100)
        provinces["Piedmont"] = CGPoint(x: 100, y: 100)
        provinces["Portugal"] = CGPoint(x: 100, y: 100)
        provinces["Prussia"] = CGPoint(x: 100, y: 100)
        provinces["Rome"] = CGPoint(x: 100, y: 100)
        provinces["Ruhr"] = CGPoint(x: 100, y: 100)
        provinces["Rumania"] = CGPoint(x: 100, y: 100)
        provinces["Serbia"] = CGPoint(x: 100, y: 100)
        provinces["Sevastopol"] = CGPoint(x: 100, y: 100)
        provinces["Silesia"] = CGPoint(x: 100, y: 100)
        provinces["Skagerrak"] = CGPoint(x: 100, y: 100)
        provinces["Smyrna"] = CGPoint(x: 100, y: 100)
        provinces["Spain"] = CGPoint(x: 100, y: 100)
        provinces["St Petersburg"] = CGPoint(x: 100, y: 100)
        provinces["Sweden"] = CGPoint(x: 100, y: 100)
        provinces["Switzerland"] = CGPoint(x: 100, y: 100)
        provinces["Syria"] = CGPoint(x: 100, y: 100)
        provinces["Trieste"] = CGPoint(x: 100, y: 100)
        provinces["Tunis"] = CGPoint(x: 100, y: 100)
        provinces["Tuscany"] = CGPoint(x: 100, y: 100)
        provinces["Tyrolia"] = CGPoint(x: 100, y: 100)
        provinces["Tyrrhenian Sea"] = CGPoint(x: 100, y: 100)
        provinces["Ukraine"] = CGPoint(x: 100, y: 100)
        provinces["Venice"] = CGPoint(x: 100, y: 100)
        provinces["Vienna"] = CGPoint(x: 100, y: 100)
        provinces["Wales"] = CGPoint(x: 100, y: 100)
        provinces["Warsaw"] = CGPoint(x: 100, y: 100)
        provinces["Western Mediterranean"] = CGPoint(x: 100, y: 100)
        provinces["Yorkshire"] = CGPoint(x: 100, y: 100)
        
        super.viewDidLoad()
        self.scrollView.minimumZoomScale = 0.35
        self.scrollView.maximumZoomScale = 1.0
        self.scrollView.canCancelContentTouches = false
        self.scrollView.delaysContentTouches = true
        placePiece("austria-army", province: "Adriatic Sea")
        placePiece("british-army", province: "Aegean Sea")
        placePiece("france-army", province: "Albania")
        placePiece("germany-army", province: "Ankara")
        placePiece("russia-army", province: "Apulia")
        placePiece("italy-army", province: "Armenia")
        placePiece("france-army", province: "Baltic Sea")
        
        var tapGesture = UITapGestureRecognizer(target: self, action: "processMapTap:")
        tapGesture.cancelsTouchesInView = false
        scrollView.addGestureRecognizer(tapGesture)
    }
    
    func processMapTap(sender : UITapGestureRecognizer) {
        if (isMovingPiece) {
            movePiece(sender.locationInView(self.scrollView))
            isMovingPiece = false
        }
    }
    
    func processTap(sender : UITapGestureRecognizer) {
        selectedPiece = sender.view as UIImageView
        isMovingPiece = true
    }

    func movePiece(point : CGPoint) {
        selectedPiece.frame = CGRect(origin: point, size: selectedPiece.frame.size)
    }

    func placePiece(pieceName : String, province : String) {
        let image = UIImage(named: pieceName)
        let piece = UIImageView(frame: CGRect(origin: provinces[province]!, size: CGSize(width: 48, height: 62)))
        piece.image = image
        
        piece.userInteractionEnabled = true
        var tapGesture = UITapGestureRecognizer(target: self, action: "processTap:")
        tapGesture.cancelsTouchesInView = false
        piece.addGestureRecognizer(tapGesture)
        
        self.containerView.addSubview(piece)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        println("touched")
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.containerView
    }

}
