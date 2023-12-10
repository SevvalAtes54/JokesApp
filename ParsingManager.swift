//
//  ParsingManager.swift
//  JokesApp
//
//  Created by Macbook Air on 9.12.2023.
//

import Foundation

protocol ParsingManagerDelegate : AnyObject{
    func parseUpdated(gonderildiVeri: JokesModel, _ manager : ParsingManager)
  //  func parseForInstances(instanceVeri : JokesModel, _ manager : ParsingManager)
    
}
struct ParsingManager {
    
    let delegate : ParsingManagerDelegate?
    init(delegate: ParsingManagerDelegate) {
           self.delegate = delegate
       }
    let url = "https://v2.jokeapi.dev/joke/"
    func fetchUrl(filter : String){
        print("filter is : \(filter)")
        let filteredUrl = "\(url)\(filter)?amount=1"
        print(filteredUrl)
        performRequest(sendedUrl: filteredUrl)
        
    }
    func performRequest(sendedUrl : String) {
        print("perfoma girdi")
        if  let URL = URL(string: sendedUrl){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: URL){ data,response,error in
                if error != nil {
              //      print(error)
                }
                if let safeUrl = data{
                    
                    if let decoded = parseJson(sendedData: safeUrl) {
                        self.delegate?.parseUpdated(gonderildiVeri: decoded, self)
                    }
                  
                }
            }
            task.resume()
        }
        
    }
    
}





func parseJson(sendedData : Data) -> JokesModel?{
   let decoder = JSONDecoder()
    print("parsa girdi")
    do{
         let decoded =  try decoder.decode(JokesData.self, from: sendedData)
        let category = decoded.category
        let setup = decoded.setup
        let delivery = decoded.delivery
        let id = decoded.id
        
        let jokesModel = JokesModel(idM: id,errorM: false, categoryM: category, typeM: "type", setupM: setup, deliveryM: delivery)
        print(jokesModel)
        return jokesModel
    }
    catch{
        
    }
    return JokesModel(idM: 0, errorM: true, categoryM: " ", typeM: " ", setupM: " ", deliveryM: " ")
    
}
