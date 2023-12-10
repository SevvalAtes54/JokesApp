//
//  ViewController.swift
//  JokesApp
//
//  Created by Macbook Air on 9.12.2023.
//

import UIKit
import TinyConstraints
class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,ParsingManagerDelegate {

    var showJokeVC : ShowJokeVC?
    var parsingManager: ParsingManager?
    var selectedItem : String?
    let categories: [String] = ["Misc", "Programming", "Dark", "Pun", "Spooky", "Christmas"]
    let jokeText  : UITextView  = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    let getJokeButton  : UIButton =  {
        let buton = UIButton()
        buton.translatesAutoresizingMaskIntoConstraints = false
        return buton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(categoryPicker)
      
        view.addSubview(jokeText)
        view.addSubview(getJokeButton)
        let categoryPicker = UIPickerView()
        view.backgroundColor = .white
    //    let categories :[String] = ["Misc","Programming","Dark","Pun","Spooky","Christmas"]
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        view.addSubview(categoryPicker)
        categoryPicker.topToSuperview(offset: 100)
        categoryPicker.centerXToSuperview()
        
        
        view.addSubview(getJokeButton)
        getJokeButton.topToSuperview(offset: 400)
        getJokeButton.centerXToSuperview()
        getJokeButton.width(100)
        getJokeButton.height(60)
        getJokeButton.layer.cornerRadius = 8
        getJokeButton.setTitle("Get Joke", for: .normal)
        getJokeButton.backgroundColor = .systemGreen
        
        getJokeButton.addTarget(self, action: #selector(jokeButton), for: .touchUpInside)
        parsingManager = ParsingManager(delegate: self)
        
    }
   

  
 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    

        return categories[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedItem = categories[row]
        
      
    }
   
    @objc func jokeButton(){
        guard let selectedItem = selectedItem else {
        
             return
         }
        print("Selected Item: \(selectedItem)")
      
      
        parsingManager?.fetchUrl(filter: selectedItem)
     }
    func parseUpdated(gonderildiVeri: JokesModel, _ manager: ParsingManager) {
        print("hooo")
                print(gonderildiVeri)
                
        DispatchQueue.main.async {
            // showJokeVC = nextViewcontroller
             let nextViewController = ShowJokeVC()
              nextViewController.modalPresentationStyle = .fullScreen
            nextViewController.getValues(values: gonderildiVeri)
            self.present(nextViewController, animated: false)
          
       
        }
                

        
    }
    
}

