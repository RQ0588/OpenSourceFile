//
// Created by Raija on 16/8/10.
// Copyright (c) 2016 ___RQ___. All rights reserved.
//

import Foundation
import UIKit

class ManTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad()  {

        super.viewDidLoad()

        self.title = "tableView"

        let width = UIKit.UIScreen.mainScreen().bounds.size.width

        let height = UIKit.UIScreen.mainScreen().bounds.size.height

        let rect = CGRectMake(0, 0, width, height)

        let manTabelView = UITableView(frame: rect, style: .Plain)

        manTabelView.dataSource = self

        manTabelView.delegate = self

        self.view.addSubview(manTabelView)
    }

    //MARK: -- 数据源
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "cell"

        let cell = UITableViewCell(style: .Default, reuseIdentifier: identifier)

        cell.textLabel?.text = "swift ..."

        return cell
    }

    //MARK: -- 委托方法
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
}
