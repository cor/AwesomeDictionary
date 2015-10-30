//
//  ViewController.swift
//  AwesomeDictionary
//
//  Created by Cor Pruijs on 29-10-15.
//  Copyright © 2015 Cor Pruijs. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    var wordDefinitions = [WordDefinition]()
    var filteredWordDefinitions = [WordDefinition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sampleWords = [
            WordDefinition(word: "Verderkijker",
                definition: "Gewoon een verekijker maar dan logisch",
                example: "Cor keek door zijn verderkijker"),
            WordDefinition(word: "Inschatsysteem",
                definition: "Het systeem in je hoofd dat verantwoordleijk is voor dingen inschatten",
                example: "Ite jouw inschatsysteem is echt slecht"),
            WordDefinition(word: "Adoptienier",
                definition: "Een geadopteerde nier",
                example: "Wouter: Wat is een adoptienier?")
        ]
        
        self.wordDefinitions = sampleWords
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableView == self.searchDisplayController!.searchResultsTableView ? filteredWordDefinitions.count : wordDefinitions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        // use the filtered results if the user is searching
        let wordDefinition = tableView == self.searchDisplayController!.searchResultsTableView ?
            filteredWordDefinitions[indexPath.row] : wordDefinitions[indexPath.row]
        
        cell.textLabel?.text = wordDefinition.word
        return cell
    }
    
    func filterContentForSearchText(searchText: String) {
        self.filteredWordDefinitions = self.wordDefinitions.filter() {
            (wordDefinition: WordDefinition) -> Bool in
            let stringMatch = wordDefinition.word.rangeOfString(searchText)
            return stringMatch != nil // if it isn't nil, then there's a match
        }
    }

    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool {
        self.filterContentForSearchText(searchString!)
        return true
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("wordDefinitionDetail", sender: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "wordDefinitionDetail" {
            let wordDefinitionDetailViewController = segue.destinationViewController as! DetailViewController
            if sender as! UITableView == self.searchDisplayController!.searchResultsTableView {
                let indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow!
                let destinationTitle = self.filteredWordDefinitions[indexPath.row].word
                wordDefinitionDetailViewController.title = destinationTitle
                wordDefinitionDetailViewController.wordDefinition = self.filteredWordDefinitions[indexPath.row]
            } else {
                let indexPath = self.tableView.indexPathForSelectedRow!
                let destinationTitle = self.wordDefinitions[indexPath.row].word
                wordDefinitionDetailViewController.title = destinationTitle
                wordDefinitionDetailViewController.wordDefinition = self.wordDefinitions[indexPath.row]
            }
        }
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text!)
        return true
    }

}

