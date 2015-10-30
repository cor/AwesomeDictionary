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
    var wordDefinition: WordDefinition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definitionLabel.lineBreakMode = .ByWordWrapping
        definitionLabel.numberOfLines = 0
        
        wordLabel.text = wordDefinition.word
        definitionLabel.text = wordDefinition.definition
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
