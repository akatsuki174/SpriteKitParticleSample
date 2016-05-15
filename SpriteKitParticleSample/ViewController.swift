//
//  ViewController.swift
//  SpriteKitParticleSample
//
//  Created by akatsuki174 on 2016/05/08.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var selectedParticle:String?
    var selectedRow: NSIndexPath?
    let particles = ["Bokeh", "Fire", "Fireflies", "Magic", "Rain", "Smoke", "Snow", "Spark"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        if (selectedRow != nil) {
            tableView?.deselectRowAtIndexPath(selectedRow!, animated: false)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return particles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = particles[indexPath.row]
        return cell
    }
    
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        selectedParticle = particles[indexPath.row]
        performSegueWithIdentifier("showContentsVC",sender: nil)
        selectedRow = indexPath
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showContentsVC") {
            let vc: ContentsViewController = (segue.destinationViewController as? ContentsViewController)!
            vc.text = selectedParticle
        }
    }
    
    @IBAction func backFromContentsVC(segue:UIStoryboardSegue){}
}
