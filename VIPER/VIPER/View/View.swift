//
//  View.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 02.01.2022.
//

import UIKit

protocol SettingsViewProtocol: AnyObject {
    var presenter: SettingsPresenterProtocol? { get set }

    func pushViewController(_ viewController: SettingsViewProtocol)
}

//MARK: - ViewController

class SettingsAppViewController: UIViewController {

    var presenter: SettingsPresenterProtocol?

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    //MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierechy()
        setupView()
        setupLayout()
        presenter?.getStartingData()
    }

    //MARK: - Settings

    private func setupHierechy() {
        view.addSubview(tableView)
    }

    private func setupView() {
        title = "Настройки"
    }

    private func setupLayout() {
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }

    //MARK: - Other functions -

    func pushViewController(_ viewController: SettingsViewProtocol) {
        guard let newViewController = viewController as? UIViewController else { return }
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

}

//MARK: - Extensions

extension SettingsAppViewController: SettingsViewProtocol {
    
}

extension SettingsAppViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.openAnotherScreen()
    }
}

extension SettingsAppViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection(section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else { return UITableViewCell() }

        let settingsPoint = presenter?.getCurrentSettingsPoint(with: indexPath)
        cell.configureCell(with: settingsPoint, presenter: presenter)

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSections() ?? 0
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
