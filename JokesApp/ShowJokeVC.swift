//
//  ShowJokeVC.swift
//  JokesApp
//
//  Created by Macbook Air on 9.12.2023.
//

import UIKit
import TinyConstraints
class ShowJokeVC: UIViewController {
    var viewcontroller: ViewController?
    var parsingManager: ParsingManager?

    let setupText : UITextView = {
        let setup = UITextView()
        setup.translatesAutoresizingMaskIntoConstraints = false
        return setup
        
    }()
    let deliveryText : UITextView = {
        let delivery = UITextView()
        delivery.translatesAutoresizingMaskIntoConstraints = false
        return delivery
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
      let image = UIImage(named: "background")
        let imageview = UIImageView(image: image)
//        imageview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageview)
        imageview.edgesToSuperview()
//        
   
        view.backgroundColor = .white
        
        setupText.translatesAutoresizingMaskIntoConstraints = false
        setupText.backgroundColor = .clear
     
        setupText.tintColor = .black
        setupText.font = .systemFont(ofSize: 25)
        view.addSubview(setupText)
        
        // setupText konumlandırması
        setupText.topToSuperview(offset: 100)
        setupText.centerXToSuperview()
        setupText.width(300)
        setupText.height(300)
        
       
        deliveryText.translatesAutoresizingMaskIntoConstraints = false
        deliveryText.backgroundColor = .clear
      
        deliveryText.tintColor = .black
        deliveryText.font = .systemFont(ofSize: 25)
        view.addSubview(deliveryText)
     
        
        deliveryText.topToSuperview(offset: 250)
        deliveryText.centerXToSuperview()
        deliveryText.width(300)
        deliveryText.height(300)
    }

    
    func getValues(values: JokesModel){
        print("sasdsa")
        print(values)
        setupText.text = values.setupM
        deliveryText.text = values.deliveryM
    }


}
