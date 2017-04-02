//
//  ViewController.swift
//  project1 storm viewer
//
//  Created by Roman Subrichak on 3/22/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	
	var pictures = [String]()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Storm Viewer"
		
		let fm = FileManager.default
		let path = Bundle.main.resourcePath!
		pictures = try! fm.contentsOfDirectory(atPath: path).filter {$0.hasPrefix("nssl") }
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pictures.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
		cell.textLabel?.text = pictures[indexPath.row]
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
			vc.selectedImage = pictures[indexPath.row]
			navigationController?.pushViewController(vc, animated: true)
		}
	}

}

