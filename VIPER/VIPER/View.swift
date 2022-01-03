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

    func update(with settingsPoints: [SettingsPoint])
}

class UserViewController: UIViewController {

    var presenter: AnyPresenter?

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isHidden = true
        return tableView
    }()

    var settingsPoints: [SettingsPoint] = []

    //MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierechy()
        setupTableView()
        setupView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tableView.frame = view.bounds
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
    }

    //MARK: - Updates

    func update(with settingsPoints: [SettingsPoint]) {
        print("got users")
        self.settingsPoints = settingsPoints
        //self.tableView.reloadData()
        self.tableView.isHidden = false
    }

}

//MARK: - Extensions

extension UserViewController: AnyView {

}

extension UserViewController: UITableViewDelegate {

}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsPoints.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = settingsPoints[indexPath.row].name

        return cell
    }

}
