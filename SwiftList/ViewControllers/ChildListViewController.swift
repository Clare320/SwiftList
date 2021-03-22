//
//  ChildListViewController.swift
//  SwiftList
//
//  Created by lingjie on 2021/3/18.
//

import UIKit

class ChildListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    var color: UIColor?
    var updateOutsideScrollViewEnabledClosure: (Bool) -> Void = { _ in }
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    func setupView() {
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 60
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(indexPath.row)"
        cell.contentConfiguration = content
        cell.contentView.backgroundColor = color
        
        return cell
    }
}

extension ChildListViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY == 0 {
            tableView.isScrollEnabled = false
            updateOutsideScrollViewEnabledClosure(true)
        }
    }
}
