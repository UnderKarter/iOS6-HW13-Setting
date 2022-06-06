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
    case boolCell (model: BoolOption)
    case notificationCell (model: NotificationOption)
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
        table.register(
            BoolViewCell.self,
            forCellReuseIdentifier: BoolViewCell.identifier
        )
        table.register(NotificationViewCell.self, forCellReuseIdentifier: NotificationViewCell.identifier)
        
        return table
    }()
    
    var models = [Section]()
    // кол-во уведомдлений
    let notic = 2
    
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
        case .boolCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: BoolViewCell.identifier,
                for: indexPath) as? BoolViewCell else {
                    return UITableViewCell()
                }
            cell.configure(with: model)
            return cell
        case .notificationCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NotificationViewCell.identifier,
                for: indexPath) as? NotificationViewCell else {
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
        case .boolCell(let model):
            model.handler()
        case .notificationCell(let model):
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

extension ViewController {
    //MARK: - Data of Sections

    func configure() {
        
        //MARK: - Section #1
        models.append(Section(opitions: [
            .switchCell(model: SwitchOption(
                title: "Авиарежим",
                icon: UIImage(systemName: "airplane"),
                iconBackgroundColor: UIColor.systemOrange,
                handler: {
                    print("Нажата ячейка Авиарежим")
                },
                isOn: false
            )),
            
            .boolCell(model: BoolOption(
                title: "Wi-Fi",
                icon: UIImage(systemName: "wifi"),
                iconBackgroundColor: UIColor.systemBlue,
                handler: {
                print("Нажата ячейка Wi-Fi")
                },
                isOn: false,
                label: "Не подкл."
            )),
            
            .boolCell(model: BoolOption(
                title: "Bluetooth",
                icon: UIImage(systemName: "arrow.left.to.line.compact"),
                iconBackgroundColor: UIColor.systemBlue,
                handler: {
                    print("Нажата ячейка Bluetooth")
                },
                isOn: false,
                label: "Выключен"
            )),
            
            .staticCell(model: StaticOption(
                title: "Сотовая связь",
                icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
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
                icon: UIImage(systemName: "network.badge.shield.half.filled"),
                iconBackgroundColor: UIColor.systemBlue,
                handler: {
                    print("Нажата ячейка VPN")
                },
                isOn: false
            ))
        ]))
        //MARK: - Section #2
        models.append(Section(opitions: [
            .staticCell(model: StaticOption(
                title: "Уведомления",
                icon: UIImage(systemName: "bell.badge"),
                iconBackgroundColor: UIColor.orange){
                    print("Нажата ячейка Уведомления")
                }),
            
            .staticCell(model: StaticOption(
                title: "Звуки, тактильные сигналы",
                icon: UIImage(systemName: "person.wave.2"),
                iconBackgroundColor: UIColor.systemRed){
                    print("Нажата ячейка Звуки, тактильные сигналы")
                }),
            
            .staticCell(model: StaticOption(
                title: "Фокусирование",
                icon: UIImage(systemName: "moon.fill"),
                iconBackgroundColor: UIColor.systemPurple){
                    print("Нажата ячейка Фокусирование")
                }),
            
            .staticCell(model: StaticOption(
                title: "Экранное время",
                icon: UIImage(systemName: "hourglass"),
                iconBackgroundColor: UIColor.systemPurple){
                    print("Нажата ячейка Экранное время")
                })
        ]))
        //MARK: - Section #3
        models.append(Section(opitions: [
            .notificationCell(model: NotificationOption(
                title: "Основные",
                icon: UIImage(systemName: "gear"),
                iconBackgroundColor:  UIColor.systemGray,
                handler: {
                    print("Нажата ячейка Основные")
                },
                number: notic,
                backgroundNotificaton: UIColor.systemRed
            )),
            
            .staticCell(model: StaticOption(
                title: "Пунк управления",
                icon: UIImage(systemName: "switch.2"),
                iconBackgroundColor: UIColor.systemGray){
                    print("Нажата ячейка Пунк управления")
                }),
            
            .staticCell(model: StaticOption(
                title: "Экран и яркость",
                icon: UIImage(systemName: "textformat.size"),
                iconBackgroundColor: UIColor.blue){
                    print("Нажата ячейка Экран и яркость")
                }),
            
            .staticCell(model: StaticOption(
                title: "Экран Домой",
                icon: UIImage(systemName: "calendar"),
                iconBackgroundColor: UIColor.blue){
                    print("Нажата ячейка Экран Домой")
                }),
            
            .staticCell(model: StaticOption(
                title: "Универсальный доступ",
                icon: UIImage(systemName: "person.crop.square.filled.and.at.rectangle.fill"),
                iconBackgroundColor: UIColor.systemBlue){
                    print("Нажата ячейка Универсальный доступ")
                }),
                
            .staticCell(model: StaticOption(
                title: "Обои",
                icon: UIImage(systemName: "cloud"),
                iconBackgroundColor: UIColor.systemCyan){
                    print("Нажата ячейка Обои")
                }),
                
            .staticCell(model: StaticOption(
                title: "Siri и Поиск",
                icon: UIImage(systemName: "s.circle"),
                iconBackgroundColor: UIColor.systemPurple){
                    print("Нажата ячейка Siri и Поиск")
                }),
            
            .staticCell(model: StaticOption(
                title: "Face ID и код-пароль",
                icon: UIImage(systemName: "faceid"),
                iconBackgroundColor: UIColor.systemGreen){
                    print("Нажата ячейка Face ID и код-пароль")
                }),
            
            .staticCell(model: StaticOption(
                title: "Экстренный вызов - SOS",
                icon: UIImage(systemName: "umbrella"),
                iconBackgroundColor: UIColor.systemRed){
                    print("Нажата ячейка Экстренный вызов - SOS")
                }),
            
            .staticCell(model: StaticOption(
                title: "Уведомление о контакте",
                icon: UIImage(systemName: "circle.hexagongrid.fill"),
                iconBackgroundColor: UIColor.systemRed){
                    print("Нажата ячейка Уведомление о контакте")
                }),
                
            .staticCell(model: StaticOption(
                title: "Аккумулятор",
                icon: UIImage(systemName: "battery.75"),
                iconBackgroundColor: UIColor.systemGreen){
                    print("Нажата ячейка Аккумулятор")
                }),
            
            .staticCell(model: StaticOption(
                title: "Конфиденциальность",
                icon: UIImage(systemName: "hand.raised.fill"),
                iconBackgroundColor: UIColor.blue){
                    print("Нажата ячейка Конфидециальность")
                })
        ]))
    }
}
