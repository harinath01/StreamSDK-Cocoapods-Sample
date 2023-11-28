//
//  ViewController.swift
//  StreamSDK-Cocoapods-Sample
//
//  Created by Testpress on 28/11/23.
//

import UIKit
import SwiftUI
import TPStreamsSDK


class ViewController: UIViewController {
    @IBOutlet weak var playerContainer: UIView!
    var player: TPAVPlayer!
    var playerViewController: TPStreamPlayerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayerView()
        player?.play()
    }
    
    func setupPlayerView(){
        player = TPAVPlayer(assetID: "AgAFNEJn3kt", accessToken: "f9b11692-78c5-4d14-9385-5f1efb0b8f4e")
        playerViewController = TPStreamPlayerViewController()
        playerViewController?.player = player
        playerViewController!.delegate = self

        addChild(playerViewController!)
        playerContainer.addSubview(playerViewController!.view)
        playerViewController!.view.frame = playerContainer.bounds
    }
}

extension ViewController: TPStreamPlayerViewControllerDelegate {
    func willEnterFullScreenMode() {
        print("willEnterFullScreenMode")
    }
    
    func didEnterFullScreenMode() {
        print("didEnterFullScreenMode")
    }
    
    func willExitFullScreenMode() {
        print("willExitFullScreenMode")
    }
    
    func didExitFullScreenMode() {
        print("didExitFullScreenMode")
    }
}

