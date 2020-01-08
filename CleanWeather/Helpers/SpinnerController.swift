//
//  SpinnerController.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 14/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import UIKit
import Lottie

final class SpinnerController: UIViewController {

    @IBOutlet private weak var lottieView: AnimationView?

    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        setupLottieView(animation: .sodaLoader)
    }
}

private extension SpinnerController {

    private func setupLottieView(animation: String) {
        lottieView?.animation = Animation.named(animation)
        lottieView?.loopMode = .loop
        lottieView?.animationSpeed = 2.5
        lottieView?.play()
    }
}

private extension String {

    static let colorDots = "1221-loader-animation"
    static let sodaLoader = "94-soda-loader"
}
