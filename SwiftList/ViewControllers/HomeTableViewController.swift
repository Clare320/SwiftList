//
//  HomeTableViewController.swift
//  SwiftList
//
//  Created by lingjie on 2021/3/8.
//

import UIKit
import Flutter

class HomeTableViewController: UITableViewController {

    let cellIdentifier = "HomeTableViewConttroller"
    
    lazy var source = [
        "UITableView-MultiSelect",
        "UITableView-UIDiffableDataSource",
        "UICollectionView",
        "UICollectionViewController",
        "头部固定",
        "ZhiHuLatestViewController",
        "RxContentViewController",
        "CheckViewController",
        "PrivacyViewController"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        setupRightNaviItem()
        
        
        let _ = StartTime.appStartTime()
        
    }

    func setupRightNaviItem() {
        let rightItem = UIBarButtonItem(title: "Flutter", style: .plain, target: self, action: #selector(presentFlutterViewController))
        navigationItem.rightBarButtonItem = rightItem
    }
    
    @objc
    func presentFlutterViewController() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        navigationController?.present(flutterViewController, animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return source.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        // Configure the cell...

        cell.textLabel?.text = source[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = SoftViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = DiffableDataSourceViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = StickyHeaderViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = CheckViewController()
            push(vc)
        default:
            pushViewControlerInStoryBord(identifier: source[indexPath.row])
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIViewController {
    func push(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushViewControlerInStoryBord(identifier: String) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: identifier)
        push(vc)
    }
}
