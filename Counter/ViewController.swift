//
//  ViewController.swift
//  Counter
//
//  Created by Павел Кузнецов on 24.07.2025.
//

import UIKit

final class ViewController: UIViewController {

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "[dd.MM.yyyy HH:mm:ss]: "
        return formatter
    }()
    
    @IBOutlet weak var logTextView: UITextView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "0"
        increaseButton.tintColor = .red
        decreaseButton.tintColor = .blue
        deleteButton.tintColor = .gray
        logTextView.showsVerticalScrollIndicator = true
        logTextView.alwaysBounceVertical = true
        logTextView.text = "История изменений:\n\n"
    }
    
    private func log(_ message: String) {
        logTextView.text += dateFormatter.string(from: Date()) + message + "\n\n"
    }
    
    @IBAction func setZero(_ sender: Any) {
        counter = 0
        counterLabel.text = "0"
        log("значение сброшено")
    }
    @IBAction func decreaseCounter(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = String(counter)
            log("значение изменено на -1")
        } else {
            log("попытка уменьшить значение счетчика ниже 0")
        }
    }
    @IBAction func increaseCounter(_ sender: Any) {
        counter += 1
        counterLabel.text = String(counter)
        log("значение изменено на +1")
    }
}

