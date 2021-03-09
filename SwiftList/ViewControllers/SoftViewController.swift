//
//  SoftViewController.swift
//  SwiftList
//
//  Created by lingjie on 2021/3/8.
//

import UIKit

class SoftViewController: BaseViewController {

    private let cellIdentifier = String(describing: type(of: self))
    
    lazy var source = [
        [
            "fieldName": "排序方式",
            "list": [
                ["id": 0, "name": "正序"],
                ["id": 1, "name": "倒序"],
            ]
        ],
        [
            "fieldName": "排序属性",
            "list": [
                ["id": 0, "name": "时间"],
                ["id": 1, "name": "价格"],
            ]
        ],
    ]
    
    var selectedSections = [0, 0]
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "多选"
        
        setupTableView()
    }
    
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.frame = view.frame
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
}

extension SoftViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return source.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = source[section]
        return (item["list"] as! Array<[String: Any]>).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.selectionStyle = .none
        
        let section = indexPath.section
        let row = indexPath.row
        
        let text = (source[section]["list"] as! [[String: Any]])[row]["name"] as! String
        
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = text
            cell.contentConfiguration = content
        } else {
            cell.textLabel?.text = text
        }
        
        cell.accessoryType = selectedSections[section] == row ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return source[section]["fieldName"] as? String
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSections[indexPath.section] = indexPath.row
        tableView.reloadSections(IndexSet([indexPath.section]), with: .fade)
    }
}
