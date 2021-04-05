//
//  ImageViewController.swift
//  Cassini
//
//  Created by bogdanov on 31.03.21.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    var imageUrl: URL? {
        didSet {
            image = nil
            if view.window != nil {
                
            }
            fetchImage()
        }
    }

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.bounds.size
            spinner?.stopAnimating()
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if imageUrl == nil {
//            imageUrl = DemoURLs.cassini
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    func fetchImage() {
        spinner.startAnimating()
        if let url = imageUrl {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let  urlContents = try? Data(contentsOf: url)
                if let imageData = urlContents, url == self?.imageUrl {
                    DispatchQueue.main.async {
                        self?.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
}
