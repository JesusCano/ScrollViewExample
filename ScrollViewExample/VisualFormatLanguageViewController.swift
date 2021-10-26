//
//  VisualFormatLanguageViewController.swift
//  ScrollViewExample
//
//  Created by Jesus Jaime Cano Terrazas on 24/07/21.
//

import UIKit

class VisualFormatLanguageViewController: UIViewController {
    
    @IBOutlet weak var containerScrollView: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.createViews(numberOfViews: 40)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: Private Methods
    
    private func createViews(numberOfViews: Int) {
        
        var verticalViews: [String: UIView] = [:]
        var verticalElements: [String] = []
        var metrics: [String: Int] = [:]
        
        for x in 0..<numberOfViews {
            print("Creamos view[\(x)]")
            
            let view = UIView()
            
            let red = CGFloat(arc4random() % 255)
            let green = CGFloat(arc4random() % 255)
            let blue = CGFloat(arc4random() % 255)
            
            view.backgroundColor = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
            
            // Disable every time that we use constraints with visualFormat, because the new contraints have problems with the old added constraints
            view.translatesAutoresizingMaskIntoConstraints = false
            
            containerScrollView.addSubview(view)
            
            // Create ID for each  view
            let viewIdentifier = "view\(x)"
            // Add view to the dictionary with his identifier
            verticalViews[viewIdentifier] = view
            // Save the identifier for vertical constraints
            
            verticalElements.append("(30)-[\(viewIdentifier)(ALTURA\(x))]")
            metrics["ALTURA\(x)"] = Int(arc4random() % 100)
            
            // Creation of horizontal contraints
            let horizontalFormat = "H:|-(16)-[\(viewIdentifier)]-(16)-|"
            //Creating contraints
            let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalFormat, options: .alignAllFirstBaseline, metrics: nil, views: verticalViews)
            
            containerScrollView.addConstraints(horizontalConstraints)
            
        }
        
        let verticalFormat = "V:|-\(verticalElements.joined(separator: "-"))-(0)-|"
        print(verticalFormat)
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: verticalFormat, options: .alignAllLeft, metrics: metrics, views: verticalViews)
        
        containerScrollView.addConstraints(verticalConstraints)
        
        
    }

}
