import UIKit
import TPStreamsSDK

class ViewController: UIViewController {
    @IBOutlet weak var playerContainer: UIView!
    
    private var player: TPAVPlayer!
    private var playerViewController: TPStreamPlayerViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayerView()
        player?.play()
    }

    private func setupPlayerView() {
        initializePlayer()
        configurePlayerView()
    }

    private func initializePlayer() {
        player = TPAVPlayer(assetID: "YtuNKqjgK9D", accessToken: "fd591e6b-be1d-4703-929a-a6188540cfed") { error in
            guard error == nil else {
                print("Setup error: \(error!.localizedDescription)")
                return
            }
            
            self.player?.limitAvailableVideoQualities(byMaxHeight: 480)
            if let maxQuality = self.player?.availableVideoQualities.last {
                self.player?.changeVideoQuality(to: maxQuality)
            }
        }
    }

    private func configurePlayerView() {
        playerViewController = TPStreamPlayerViewController()
        playerViewController?.player = player
        playerViewController?.delegate = self

        let config = TPStreamPlayerConfigurationBuilder()
            .setPreferredForwardDuration(15)
            .setPreferredRewindDuration(5)
            .setprogressBarThumbColor(.systemBlue)
            .setwatchedProgressTrackColor(.systemBlue)
            .build()

        playerViewController?.config = config

        addChild(playerViewController!)
        playerContainer.addSubview(playerViewController!.view)
        playerViewController?.view.frame = playerContainer.bounds
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
