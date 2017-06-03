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
    var selectedRow: IndexPath?
    let particles = ["Bokeh", "Fire", "Fireflies", "Magic", "Rain", "Smoke", "Snow", "Spark"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if (selectedRow != nil) {
            tableView?.deselectRow(at: selectedRow!, animated: false)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return particles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = particles[indexPath.row]
        return cell
    }
    
    func tableView(_ table: UITableView, didSelectRowAt indexPath:IndexPath) {
        selectedParticle = particles[indexPath.row]
        performSegue(withIdentifier: "showContentsVC",sender: nil)
        selectedRow = indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "showContentsVC") {
            let vc: ContentsViewController = (segue.destination as? ContentsViewController)!
            vc.text = selectedParticle
        }
    }
    
    @IBAction func backFromContentsVC(_ segue:UIStoryboardSegue){}
}
