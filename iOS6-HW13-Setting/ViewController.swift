//
//  ViewController.swift
//  iOS6-HW13-Setting
//
//  Created by temp user on 05.06.2022.
//

import UIKit

struct StaticOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (()->Void)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(
            StaticViewCell.self,
            forCellReuseIdentifier: StaticViewCell.identifier
        )
        
        return table
    }()
    
    var models = [StaticOption]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Настройки"
        
        configure()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        self.models = Array(0...10).compactMap({
            StaticOption(title: "Line \($0)",
                         icon: UIImage(systemName: "bell"),
                         iconBackgroundColor: UIColor.systemRed){
            }
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: StaticViewCell.identifier,
            for: indexPath) as? StaticViewCell else {
                return UITableViewCell()
            }
        cell.configure(with: model)
        return cell
    }
    
    // Кол-во строк в UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
}

