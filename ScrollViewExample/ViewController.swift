//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by Jesus Jaime Cano Terrazas on 10/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var contentScrollView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let pages = contentScrollView.frame.width / view.frame.width
        
        pageControl.numberOfPages = Int(pages)
    }
}

// MARK:


extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x / view.frame.width
        print("Current Page \(currentPage)")
        pageControl.currentPage = Int(currentPage)
    }
    
    
    // Para que funcione como un paginado se tiene que activar la propiedad pageEnabled en las propiedades del scrollview
    
}

