//
//  UserDefaults+enum.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import Foundation

// [enumをUserDefaultsに保存したい！](https://qiita.com/matsuji/items/a8f63d36c9b75ed7d0d2)
extension UserDefaults {

    func setEnum<T: RawRepresentable>(_ value: T?, forKey key: String) where T.RawValue == String {
        if let value = value {
            set(value.rawValue, forKey: key)
        } else {
            removeObject(forKey: key)
        }
    }

    func getEnum<T: RawRepresentable>(forKey key: String) -> T? where T.RawValue == String {
        if let string = string(forKey: key) {
            return T(rawValue: string)
        }
        return nil
    }
}
