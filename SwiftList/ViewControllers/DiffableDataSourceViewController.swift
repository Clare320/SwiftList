//
//  DiffableDataSourceViewController.swift
//  SwiftList
//
//  Created by lingjie on 2021/3/9.
//

import UIKit

class DiffableDataSource: UITableViewDiffableDataSource<SiftField, SiftItem> {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let snapshot = self.snapshot()
        let sectionField = snapshot.sectionIdentifiers[section]
        return sectionField.fieldName
    }
}

class DiffableDataSourceViewController: BaseViewController {

    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    var dataSource: DiffableDataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "UITableViewDiffableDataSource"
        
        setupUI()
        
        dataSource = DiffableDataSource(tableView: tableView) { (tableView, indexPath, item) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
            
            var content = cell.defaultContentConfiguration()
            content.text = item.name
            cell.contentConfiguration = content
            
            return cell
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<SiftField, SiftItem>()
        
        let path = Bundle.main.path(forResource: "sift", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        let respModel = try! JSONDecoder().decode(SiftRespModel.self, from: data)
        
        let list = respModel.data.addList
        snapshot.appendSections(list)
        list.forEach { (siftField) in
            snapshot.appendItems(siftField.list, toSection: siftField)
        }
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
    
    func setupUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)
    }
   
}

/**
 how to use UITableViewDiffableDataSource to show header title of Section?
 one:
    1. create custom class extends UITableViewDiffableDataSource
    2. override func
    3. get snapshot, use snapshot func to get sectionType
 */



