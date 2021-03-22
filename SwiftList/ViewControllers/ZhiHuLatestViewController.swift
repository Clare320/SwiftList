//
//  ZhiHuLatestViewController.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/3/22.
//

import UIKit
import Moya
import RxCocoa

class ZhiHuLatestViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var source: [Story] = []
    
    var dataSource: UITableViewDiffableDataSource<Int, Story>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = UITableViewDiffableDataSource<Int, Story>(tableView: tableView) { (tableView, indexPath, story) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "ZhiHu", for: indexPath)
            
            var content = cell.defaultContentConfiguration()
            content.text = story.title
            cell.contentConfiguration = content
            
            return cell
        }
        
        var snapshot = dataSource!.snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(source, toSection: 0)
        dataSource!.apply(snapshot)
        
        
        request()
        testRxRequest()
    }
    
    func request() {
        let provider = MoyaProvider<MyService>()
        provider.request(.latest) { [self] (result) in
            let decoder = JSONDecoder()
            let storyResp = try! decoder.decode(StoryResp.self, from: result.get().data)
            
            var snapshot = self.dataSource!.snapshot()
            snapshot.appendItems(storyResp.stories, toSection: 0)
            self.dataSource!.apply(snapshot)
        }
    }
    
    func testRxRequest() {
        let _ = RxRequest.request(service: .latest, type: StoryResp.self)
            .take(until: self.rx.deallocated)
            .subscribe { (resp) in
                print("resp:\(resp)")
            } onError: { (error) in
                print("error: \(error)")
            } onCompleted: {
                print("completed----->")
            } onDisposed: {
                print("disposed----->")
            }
    }
    
}
