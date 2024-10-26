//
//  ViewController.swift
//  tic tac toe
//
//  Created by Абай Бауржан on 26.10.2024.
//

import UIKit

class ViewController: UIViewController {
    var player = 1
    var arrayBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winArray = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func game(_ sender: UIButton) {
        print(sender.tag)
        if arrayBoard[sender.tag - 1] != 0 {
            return
        }
        
        arrayBoard[sender.tag - 1] = player
        
        
        if player == 1 {
            sender.setBackgroundImage(UIImage (named: "x"), for: .normal)
            player = 2
        } else {
            sender.setBackgroundImage(UIImage (named: "o"), for: .normal)
            player = 1
            
        }
        
        checkWinCondition()
        
        checkDrawCondition()
    }
    
    func checkWinCondition() {
        for win in winArray {
            if arrayBoard[win[0]] == arrayBoard[win[1]] && arrayBoard[win[1]] == arrayBoard[win[2]] {
                if arrayBoard[win[0]] == 1 {
                    showAlert(title: "X выиграл", message: "X выиграл!")
                } else if arrayBoard[win[0]] == 2 {
                    showAlert(title: "O выиграл", message: "O выиграл!")
                }
                return
            }
        }
    }
    
    func checkDrawCondition() {
        if !arrayBoard.contains(0) {
            showAlert(title: "Ничья", message: "Ничья!")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in
            self.clearBoard()
        }))
        present(alert, animated: true)
    }
    
    func clearBoard() {
        for i in 0...8 {
            let button = view.viewWithTag(i + 1) as! UIButton
            button.setBackgroundImage(nil, for: .normal)
            arrayBoard[i] = 0
        }
        player = 1
    }
}
