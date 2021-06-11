//
//  MemoListViewController.swift
//  DailyRecord
//
//  Created by DoinKim on 2021/06/11.
//

import UIKit

class MemoListViewController: UIViewController {

    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var memoListCount: UILabel!
    
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "ko_kr")
        return f
    }()
    
    func updateUI() {
        memoListCount.text = "\(DataManager.shared.memoList.count)개의 메모"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let indexPath = listTableView.indexPath(for: cell) {
            if let vc = segue.destination as? DetailViewController {
                vc.memo = DataManager.shared.memoList[indexPath.row]
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DataManager.shared.fetchMemo()
        listTableView.reloadData()
        updateUI()
        
//        listTableView.reloadData()
//        memoListCount.text = "\(Memo.dummyMemoList.count)개의 메모"
//        print(#function)
    }
    
    var token: NSObjectProtocol?
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        memoListCount.text = "\(DataManager.shared.memoList.count)개의 메모"
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.newMemoDidInsert, object: nil, queue: OperationQueue.main) { [weak self] (noti) in
            
            self?.listTableView.reloadData()
            self?.memoListCount.text = "\(DataManager.shared.memoList.count)개의 메모"
            
        }
        // Notification은 옵저버를 해재해줘야함
        
        // Do any additional setup after loading the view.
    }
    
}

extension MemoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let target = DataManager.shared.memoList[indexPath.row]
        cell.textLabel?.text = target.content
        cell.detailTextLabel?.text = formatter.string(for: target.insertDate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let target = DataManager.shared.memoList[indexPath.row]
            DataManager.shared.deleteMemo(target)
            DataManager.shared.memoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}


