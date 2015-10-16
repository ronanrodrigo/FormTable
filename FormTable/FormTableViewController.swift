//
//  FormThreeTableViewController.swift
//  FormTable
//
//  Created by Ronan Rodrigo Nunes on 10/16/15.
//  Copyright © 2015 meuspedidos. All rights reserved.
//

import UIKit

class FormTableViewController: UITableViewController {
    var elementsQuantity = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.editing = true
        tableView.registerNib(UINib(nibName: "InputTableViewCell", bundle: nil), forCellReuseIdentifier: "inputCell")
        tableView.registerNib(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "buttonCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isMultipleFieldsSection(section) {
            return elementsQuantity
        } else {
            return 2
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if  isLastLine(indexPath) && isMultipleFieldsSection(indexPath.section) {
            let buttonCell = tableView.dequeueReusableCellWithIdentifier("buttonCell", forIndexPath: indexPath) as! ButtonTableViewCell
            return buttonCell
        } else {
            let inputCell = tableView.dequeueReusableCellWithIdentifier("inputCell", forIndexPath: indexPath) as! InputTableViewCell
            inputCell.editText.placeholder = "Blaa!"
            inputCell.selectionStyle = UITableViewCellSelectionStyle.None
            return inputCell
        }
    }
    
    private func isMultipleFieldsSection(section: Int) -> Bool {
        return section != 0
    }
    
    private func isLastLine(indexPath: NSIndexPath) -> Bool {
        return indexPath.row == elementsQuantity-1
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return isMultipleFieldsSection(indexPath.section)
    }

    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if isLastLine(indexPath) {
            return UITableViewCellEditingStyle.Insert
        }
        return UITableViewCellEditingStyle.Delete
    }

    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            tableView.beginUpdates()
            elementsQuantity--
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
            tableView.endUpdates()
        } else if editingStyle == .Insert {
            addNewRow(indexPath)
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if isLastLine(indexPath) && isMultipleFieldsSection(indexPath.section) {
            addNewRow(indexPath)
        }
    }
    
    private func addNewRow(indexPath: NSIndexPath) {
        tableView.beginUpdates()
        elementsQuantity++
        let newIndexPaths = [NSIndexPath(forRow: indexPath.row+1, inSection: indexPath.section)]
        tableView.insertRowsAtIndexPaths(newIndexPaths, withRowAnimation: UITableViewRowAnimation.None)
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        tableView.endUpdates()
    }


}