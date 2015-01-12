//
//  EmojiListViewController.swift
//  Emoji Table
//
//  Created by Garrett Cox on 11/17/14.
//  Copyright (c) 2014 Garrett Cox. All rights reserved.
//

import Foundation
import UIKit

class EmojiListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    /*
    struct emojiSet {
        var emojiIcon = "💩"
        var emojiDefinition = "No given Definition"
    }

    let alien = emojiSet(emojiIcon: "👽", emojiDefinition: "Alien")
    let couple = emojiSet(emojiIcon: "👭", emojiDefinition: "A couple")
    
    */
    
    var emojis = ["😒","😛","😚","👽","👀","👭","👏","👐","👍","💇","👧","👮","👳"]
   
    
    var emoji = "💩"
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //This will ensure that there is always a full screen of colored rows
        if emojis.count < 10 {
            return 10
        }
        else{
            return emojis.count
        }
        
        //return emojis.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        
        cell.textLabel?.text = self.emojis[indexPath.row]
        
        
   
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.redColor()
        }
        else{
            cell.backgroundColor = UIColor.orangeColor()
        }

        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.emoji = self.emojis[indexPath.row]
        self.performSegueWithIdentifier("tableViewToEmojiSegue", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var detailViewController = segue.destinationViewController as EmojiDetailViewController
        
        detailViewController.emoji = self.emoji
        
        
        if self.emoji == "👽" {
            detailViewController.emojiDefinition = "Alien"
        }
        
        
        
        
        
        
    }
    
    
    
    
    
}