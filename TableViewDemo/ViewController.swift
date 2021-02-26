//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Kieu Van Phuoc on 26/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var countries = [
        [
            Country(isoCode: "at", name: "Austria"),
            Country(isoCode: "be", name: "Belgium"),
            Country(isoCode: "de", name: "Germany"),
            Country(isoCode: "el", name: "Greece"),
            Country(isoCode: "fr", name: "France"),
        ],
        [
            Country(isoCode: "at", name: "Austria"),
            Country(isoCode: "be", name: "Belgium"),
            Country(isoCode: "de", name: "Germany")
        ]
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isEditing = true
        
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView.estimatedSectionHeaderHeight = 250
    }


}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContriesTableViewCell", for: indexPath) as! ContriesTableViewCell
        cell.contentImage.image = UIImage(named: countries[indexPath.section][indexPath.row].isoCode)
        cell.contentLabel.text = countries[indexPath.section][indexPath.row].name
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.frame.size.height))
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        label.numberOfLines = 0
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10)
        ])

        if section == 0 {
            headerView.backgroundColor = .red
            label.text = "Header section 1 eader section 1 eader section 1 eader section 1 eader section 1 eader section 1 eader section 1 eader section 1"
        } else {
            headerView.backgroundColor = .blue
            label.text = "Header section 2"
        }
        return headerView

    }
  

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(countries[indexPath.row])
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = countries[sourceIndexPath.row]
        countries.remove(at: sourceIndexPath.row)
        countries.insert(itemToMove, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}

