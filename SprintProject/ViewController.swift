//
//  ViewController.swift
//  SprintProject
//
//  Created by Sarju Maharjan on 7/17/19.
//  Copyright © 2019 Sarju Maharjan. All rights reserved.
//

import UIKit

struct Data{
    var expanded:Bool
    var title:String
    var subtitle:String
    
}

class MyCell:UITableViewCell{
//    var expanded = false
    var title = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 374, height: 50))
    var imgView:UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 100, width: 374, height: 250))
    var subtitle = UILabel.init(frame: CGRect.init(x: 0, y: 50, width: 374, height: 50))
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(imgView)
        self.addSubview(subtitle)
        self.addSubview(title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var data:[Data] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! MyCell
        cell.title.text = data[indexPath.row].title
        cell.imgView.image = UIImage.init(named: "4.jpg")
        cell.imgView.alpha = 0
        cell.subtitle.alpha = 0
        cell.subtitle.text = data[indexPath.row].subtitle
        if data[indexPath.row].expanded == false{
            cell.imgView.isHidden = true
            cell.subtitle.isHidden = true
            
            
          
//            let animation = CABasicAnimation(keyPath: "opacity")
//            animation.delegate = self
//            animation.fromValue = 0.0
//            animation.toValue = 1.0
//            animation.duration = 1.0
//            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//            cell.imgView.layer?.addAnimation(animation,forKey: "fade")
        }
        else{
            print("asdasdas")
            cell.imgView.isHidden = false
            cell.subtitle.isHidden = false
        }
        
//        cell.imageView?.frame = CGRect.init(x: 0, y: 50, width: 374, height: 350)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let d = data[indexPath.row]
//        d.expanded = !cell.expanded
        data[indexPath.row].expanded = !data[indexPath.row].expanded
        let cell = tableView.cellForRow(at: indexPath) as! MyCell
        if data[indexPath.row].expanded {
            cell.imgView.isHidden = false
            cell.subtitle.isHidden = false
            
            UIView.animate(withDuration: 1.0) {
                cell.imgView.alpha = 1.0
                cell.subtitle.alpha = 1.0
            }
            
          // tableView.reloadRows(at: indexPath.row, with: .right)
        }
        else {
            cell.imgView.alpha = 0
            cell.subtitle.alpha = 0
            cell.imgView.isHidden = true
            cell.subtitle.isHidden = true
        }
//        tableView.beg
        tableView.beginUpdates()
    tableView.endUpdates()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let d = data[indexPath.row]
        //return 50
        if !d.expanded {
            return 50
        }
        else {
            return 350
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), style: .grouped)
        tableView.register(MyCell.self, forCellReuseIdentifier: "cellID")
        tableView.delegate = self
        tableView.dataSource = self
       // tableView.rowHeight = UITableView.automaticDimension
         //tableView.estimatedRowHeight = 350
        view.addSubview(tableView)
      
        // Do any additional setup after loading the view.
    }


    func setupData(){
        for i in 0..<10{
            let temp = Data.init(expanded: false, title: "Title \(i)", subtitle: "Subtitle\(i)")
            data.append(temp)
        }
    }
}

