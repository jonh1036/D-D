//
//  SelectAttributeViewController.swift
//  D&D
//
//  Created by Jonathan de Pinho Silva on 22/01/20.
//  Copyright © 2020 Vinicius Mangueira. All rights reserved.
//

import UIKit

class SelectAttributeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var attribute: Attribute!
    var filteredValues: [String] = []
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }

    func filterContentForSearchText(_ searchText: String) {
        filteredValues = attribute.values.filter { (valor: String) -> Bool in
        return valor.lowercased().contains(searchText.lowercased())
      }

      tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Pesquise \(attribute.name)"
        navigationItem.searchController = searchController
        //remover barra de pesquisa no caso de navegacao
        definesPresentationContext = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      if let indexPath = tableView.indexPathForSelectedRow {
        tableView.deselectRow(at: indexPath, animated: true)
      }
    }
}


extension SelectAttributeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        if let text = cell?.textLabel?.text {
            attribute.currentValue = text
            if !attribute.currentValues.contains(text){
                attribute.currentValues.append(text)
            }
        }
        
        if cell?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }

        if !attribute.isMultiplyValue {
            self.performSegue(withIdentifier: "unwind", sender: attribute)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredValues.count
        }
        return attribute.values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectAttributeCell", for: indexPath)
        
        if isFiltering {
            cell.textLabel?.text = filteredValues[indexPath.row]
        } else {
            cell.textLabel?.text = attribute.values[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}

extension SelectAttributeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBarText = searchController.searchBar.text!
        filterContentForSearchText(searchBarText)
    }
}
