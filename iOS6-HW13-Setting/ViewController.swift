//
//  ViewController.swift
//  iOS6-HW13-Setting
//
//  Created by temp user on 05.06.2022.
//

import UIKit

struct Section {
    let opitions: [SettingOptionType]
}

enum SettingOptionType {
    case staticCell (model: StaticOption)
    case switchCell (model: SwitchOption)
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(
            StaticViewCell.self,
            forCellReuseIdentifier: StaticViewCell.identifier
        )
        table.register(
            SwitchViewCell.self,
            forCellReuseIdentifier: SwitchViewCell.identifier
        )
        
        return table
    }()
    
    var models = [Section]()

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
        models.append(Section(opitions: [
            .switchCell(model: SwitchOption(
                title: "Авиарежим",
                icon: UIImage(systemName: "airplane"),
                iconBackgroundColor: UIColor.systemOrange,
                handler: {
                    print("Нажата ячейка Авиарежим")
                },
                isOn: false)),
            .staticCell(model: StaticOption(
                title: "Wi-Fi",
                icon: UIImage(systemName: "wifi"),
                iconBackgroundColor: UIColor.systemBlue){
                    print("Нажата ячейка Wi-Fi")
                }),
            .staticCell(model: StaticOption(
                title: "Bluetooth",
                icon: UIImage(systemName: "airplane"),
                iconBackgroundColor: UIColor.systemBlue){
                    print("Нажата ячейка Bluetooth")
                }),
            .staticCell(model: StaticOption(
                title: "Сотовая связь",
                icon: UIImage(systemName: "airplane"),
                iconBackgroundColor: UIColor.systemGreen){
                    print("Нажата ячейка Сотовая связь")
                }),
            .staticCell(model: StaticOption(
                title: "Режим модема",
                icon: UIImage(systemName: "personalhotspot"),
                iconBackgroundColor: UIColor.systemGreen){
                    print("Нажата ячейка Режим модема")
                }),
            .switchCell(model: SwitchOption(
                title: "VPN",
                icon: UIImage(systemName: "airplane"),
                iconBackgroundColor: UIColor.systemBlue,
                handler: {
                    print("Нажата ячейка VPN")
                },
                isOn: false))
        ]))
        
        models.append(Section(opitions: [
            .staticCell(model: StaticOption(
                title: "Уведомления",
                icon: UIImage(systemName: "airplane"),
                iconBackgroundColor: UIColor.systemOrange){
                    print("Нажата ячейка Уведомления")
                }),
            .staticCell(model: StaticOption(
                title: "Звуки, тактильные сигналы",
                icon: UIImage(systemName: "wifi"),
                iconBackgroundColor: UIColor.systemRed){
                    print("Нажата ячейка Звуки, тактильные сигналы")
                }),
            .staticCell(model: StaticOption(
                title: "Фокусирование",
                icon: UIImage(systemName: "airplane"),
                iconBackgroundColor: UIColor.systemPurple){
                    print("Нажата ячейка Фокусирование")
                }),
            .staticCell(model: StaticOption(
                title: "Экранное время",
                icon: UIImage(systemName: "airplane"),
                iconBackgroundColor: UIColor.systemPurple){
                    print("Нажата ячейка Экранное время")
                })
        ]))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].opitions[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StaticViewCell.identifier,
                for: indexPath) as? StaticViewCell else {
                    return UITableViewCell()
                }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchViewCell.identifier,
                for: indexPath) as? SwitchViewCell else {
                    return UITableViewCell()
                }
            cell.configure(with: model)
            return cell
        }
    }
    
    // Вызов метода нажатием на ячеку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].opitions[indexPath.row]
        
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
        }
    
    // Кол-во секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    // Кол-во строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].opitions.count
    }
}

