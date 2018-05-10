//
//  MainViewController.swift
//  IcecreamT
//
//  Created by riceFun on 2018/5/8.
//  Copyright © 2018年 riceFun. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var functionTableView : UITableView?
    var dataArr = NSMutableArray()
    
    lazy var connectBtn : RFUIButton = {
        let tempBtn = RFUIButton(frame: CGRect(x: 0, y: 0, width: RFScreen_W * 0.6, height:40))
        tempBtn.layer.cornerRadius = 20
        tempBtn.layer.masksToBounds = true

        //传递触摸对象（即点击的按钮），需要在定义action参数时，方法名称后面带上冒号
        tempBtn.addTarget(self, action:#selector(clickconnectBtn(_:)), for:.touchUpInside)
        self.changeConnectBtnUI(state: .normal, btn: tempBtn)
        return tempBtn
    }()
    
    lazy var cennectSwitch : UISwitch = {
        let tempSwitch = UISwitch.init()
        tempSwitch.addTarget(self, action: #selector(changeStatus(_:)), for: .valueChanged)
        return tempSwitch
    }()
    
    lazy var tableHeardView : UIView = {
       let tempView = UIView(frame: CGRect(x: 0, y: 0, width: RFScreen_W, height: 300))
        tempView.backgroundColor = RF_RGB(35, 197, 252)
        tempView.addSubview(connectBtn)
        connectBtn.center = tempView.center
        return tempView
    }()
    
    lazy var tableFooterView : UILabel = {
        let tempLabel = UILabel(frame: CGRect(x: 0, y: 0, width: RFScreen_W, height: 40))
        tempLabel.backgroundColor = RF_RGB(238, 239, 246)
        tempLabel.text = "Version \(P_Version) (Build \(P_Build))"
        tempLabel.textColor = UIColor.lightGray
        tempLabel.textAlignment = NSTextAlignment.center
        return tempLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        
    }
    
    func setupUI() {
        self.title = "IcecreamT"
        self.navigationController?.navigationBar.barTintColor = RF_RGB(35, 197, 252)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "scanQR", style: .plain, target: self, action: #selector(scanQR))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "add", style: .plain, target: self, action: #selector(addss))
        
        self.view.backgroundColor = UIColor.white
        functionTableView = UITableView(frame: CGRect.init(x: 0, y: RFNaviBar_H, width: RFScreen_W, height: RFScreen_H - RFNaviBar_H ), style: .plain)
        functionTableView?.delegate = self
        functionTableView?.dataSource = self
        functionTableView?.backgroundColor = RF_RGB(238, 239, 246)
        functionTableView?.showsVerticalScrollIndicator = false
        functionTableView?.tableHeaderView = tableHeardView
        functionTableView?.tableFooterView = tableFooterView
        self.view.addSubview(functionTableView!)
//        functionTableView?.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        
    }
    
    //MARK: - tableviewDelegate & dataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellID")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "CellID")
        }
       
        if indexPath.section == 0 {
            cell?.textLabel?.text = "Shadowrocket ssA";
            cell?.detailTextLabel?.text = "   123ms   "
            cell?.detailTextLabel?.textColor = UIColor.green
            cell?.accessoryView = cennectSwitch;
        }else if indexPath.section == 1 {
            cell?.textLabel?.textAlignment = NSTextAlignment.center
            if indexPath.row == 0 {
                cell?.textLabel?.text = "Ping"
            }else if indexPath.row == 1 {
                cell?.textLabel?.text = "About"
            }
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: RFScreen_W, height: 30))
        label.textColor = UIColor.gray
        label.backgroundColor = RF_RGB(238, 239, 246)
        if section == 0 {
            label.text = "    CURRENT ONLINE"
        }else if section == 1 {
            label.text = "    SETTING"
        }
        return label;
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    //MARK: - setSomeProperty
    private func changeConnectBtnUI(state:UIControlState, btn:RFUIButton){
        if  state == .normal {
            btn.setButtonStyle(UIColor.white, "Connect", RF_RGB(36, 120, 251), for: .normal)
        } else if state == .highlighted {
            btn.setButtonStyle(UIColor.white, "Connecting...", UIColor.green, for: .normal)
        } else if state == .selected {
            btn.setButtonStyle(UIColor.white, "Stop", UIColor.red, for: .normal)
        }
    }
    
    @objc func scanQR() {
        
    }
    
    @objc func addss() {
        print("sdsdsd")
    }
    
    @objc func clickconnectBtn(_ sender: RFUIButton) {
        self.changeConnectBtnUI(state: .selected, btn: sender)
    }
    
    @objc func changeStatus(_ sender: UISwitch){
        print("sdsdsd")
    }
}
