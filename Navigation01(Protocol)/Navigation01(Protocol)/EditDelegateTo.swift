//
//  EditDelegate.swift
//  Navigation01(Protocol)
//
//  Created by Anna Kim on 2022/12/18.
//

import Foundation

protocol EditDelegate{
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}
