//
//  DetailViewController.swift
//  AwesomeDictionary
//
//  Created by Cor Pruijs on 30-10-15.
//  Copyright © 2015 Cor Pruijs. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    var wordDefinition: WordDefinition!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definitionLabel.allowMultipleLines()
        exampleLabel.allowMultipleLines()
        
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels() {
        wordLabel.text = wordDefinition.word
        definitionLabel.text = wordDefinition.definition
        exampleLabel.text = wordDefinition.example
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
