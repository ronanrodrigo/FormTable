//
//  StaticTableViewController.swift
//  FormTable
//
//  Created by Ronan Rodrigo Nunes on 10/19/15.
//  Copyright © 2015 meuspedidos. All rights reserved.
//

import UIKit

class StaticTableViewController: UITableViewController {
    
    let dynamicSections = [1]
    var telephonesQuantity = 1
    let addButton = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.editing = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isDynamicSection(section) {
            return telephonesQuantity + addButton
        } else {
            return 2
        }
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if  isLastRowOfDynamicSection(indexPath) {
            let addButtonCell = tableView.dequeueReusableCellWithIdentifier("addButtonCell", forIndexPath: indexPath)
            return addButtonCell
        } else if isDynamicSection(indexPath.section) {
            let telephoneCell = tableView.dequeueReusableCellWithIdentifier("telephoneCell", forIndexPath: indexPath)
            return telephoneCell
        }

        let cell = tableView.dequeueReusableCellWithIdentifier("defaultInputCell", forIndexPath: indexPath)
        return cell
    }
    */

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return isDynamicSection(indexPath.section)
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            telephonesQuantity--
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            tableView.beginUpdates()
            telephonesQuantity++
            let newIndexPaths = NSIndexPath(forRow: indexPath.row+1, inSection: indexPath.section)
            tableView.insertRowsAtIndexPaths([newIndexPaths], withRowAnimation: UITableViewRowAnimation.None)
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
            tableView.endUpdates()
        }    
    }

    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if(isLastRowOfDynamicSection(indexPath)) {
            return UITableViewCellEditingStyle.Insert
        }
        return UITableViewCellEditingStyle.Delete
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    override func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
        return super.tableView(tableView, indentationLevelForRowAtIndexPath: indexPath)
    }
    
    func isDynamicSection(section: Int) -> Bool {
        return dynamicSections.contains(section)
    }
    
    func isLastRowOfDynamicSection(indexPath: NSIndexPath) -> Bool {
        return isDynamicSection(indexPath.section) && indexPath.row == telephonesQuantity
    }


}
