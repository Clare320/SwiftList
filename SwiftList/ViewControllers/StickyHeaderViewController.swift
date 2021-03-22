//
//  StickyHeaderViewController.swift
//  SwiftList
//
//  Created by lingjie on 2021/3/18.
//

import UIKit

class StickyHeaderViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView(frame: .zero, style: .plain)
    lazy var viewControllers: [BaseViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "headerfooter")
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        headerView.backgroundColor = .green
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = UIView(frame: .zero)
    }
}

extension StickyHeaderViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "test"
        cell.contentConfiguration = content
        cell.backgroundColor = .yellow
        cell.selectionStyle = .none
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height - 50)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 50), collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        cell.contentView.addSubview(collectionView)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height - 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // = UITableViewHeaderFooterView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        let headerOfSection = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerfooter")!
        headerOfSection.contentView.backgroundColor = .red
        return headerOfSection
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension StickyHeaderViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
        let colors: [UIColor] = [.cyan, .brown, .darkGray, .purple, .blue]
        let color = colors[indexPath.item]
        cell.contentView.backgroundColor = colors[indexPath.item]
        
        let childListView = cell.contentView.viewWithTag(10001)
        
        if childListView !== nil {
            childListView?.removeFromSuperview()
            if indexPath.item < viewControllers.count {
                let vc = viewControllers[indexPath.item]
                cell.contentView.addSubview(vc.view)
            } else {
                let vc = ChildListViewController()
                vc.color = color
                vc.view.tag = 10001
                viewControllers.append(vc)
                cell.contentView.addSubview(vc.view)
            }
        } else {
            let vc = ChildListViewController()
            vc.color = color
            vc.view.tag = 10001
            vc.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 50)
            vc.updateOutsideScrollViewEnabledClosure = { isScrollEnabled in
                self.tableView.isScrollEnabled = isScrollEnabled
            }
            viewControllers.append(vc)
            cell.contentView.addSubview(vc.view)
        }
        return cell
    }
}

extension StickyHeaderViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY == 150 {
            tableView.isScrollEnabled = false
        }
    }
}

// 两个tableView关联isScrollEnabled

