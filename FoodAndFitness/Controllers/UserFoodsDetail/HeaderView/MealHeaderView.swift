//
//  MealHeaderView.swift
//  FoodAndFitness
//
//  Created by Mylo Ho on 4/16/17.
//  Copyright © 2017 SuHoVan. All rights reserved.
//

import UIKit

final class MealHeaderView: UIView {
    @IBOutlet fileprivate(set) weak var titleLabel: UILabel!
    @IBOutlet fileprivate(set) weak var detailLabel: UILabel!
    @IBOutlet fileprivate(set) weak var imageView: UIImageView!
    @IBOutlet fileprivate(set) weak var blurView: UIView!

    struct Data {
        var title: String
        var detail: String?
        var image: UIImage?
    }

    var data: Data? {
        didSet {
            guard let data = data else { return }
            titleLabel.text = data.title
            detailLabel.text = data.detail
            imageView.image = data.image
        }
    }
}
