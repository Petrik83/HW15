//
//  View.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 02.01.2022.
//

import Foundation
import UIKit

//ViewController
//protocol
//reference presenter

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    var settingsPoints: [[SettingsPoint]] { get set }

    func getSettingsPoints(with settingsPoints: [[SettingsPoint]])
    func pushViewController(_ viewController: AnyView)
}

//MARK: - ViewController

class SettingsAppViewController: UIViewController {

    var presenter: AnyPresenter?

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    var settingsPoints: [[SettingsPoint]] = []

    //MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierechy()
        setupTableView()
        setupView()
        setupLayout()
    }

    //MARK: - Settings

    private func setupHierechy() {
        view.addSubview(tableView)
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupView() {
        view.backgroundColor = .systemBlue
        title = "Настройки"
    }

    private func setupLayout() {
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }

    //MARK: - Other functions -

    func getSettingsPoints(with settingsPoints: [[SettingsPoint]]) {
        self.settingsPoints = settingsPoints
    }

    func pushViewController(_ viewController: AnyView) {
        guard let newViewController = viewController as? UIViewController else { return }
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

}

//MARK: - Extensions

extension SettingsAppViewController: AnyView {

}

extension SettingsAppViewController: UITableViewDelegate {

}

extension SettingsAppViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsPoints[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else { return UITableViewCell() }

        let settingsPoint = presenter?.getCurrentSettingsPoint(with: indexPath)
        cell.configureCell(with: settingsPoint, presenter: presenter)

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsPoints.count
    }
}

// MARK: - Constants

enum Metric {
    static let fontSize: CGFloat = 18
    static let cornerRadius: CGFloat = 8
    static let imageViewScale: CGFloat = 2.6
    static let leadingAnchorConstant: CGFloat = 20
    static let iconImageViewSizeMultiplier: CGFloat = 0.7
}
