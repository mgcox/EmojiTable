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
        
        return emojis.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel.text = self.emojis[indexPath.row]
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