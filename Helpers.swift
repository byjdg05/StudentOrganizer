//
//  Helpers.swift
//  StudentOrganizer
//
//  Created by Jonash De Guia on 10/23/26.
//

import UIKit

extension UIViewController {
    /// Shows a simple alert for validation messages.
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension UIImage {
    /// Shrinks large photos to help keep the local database smaller.
    func resized(maxDimension: CGFloat) -> UIImage {
        let longestSide = max(size.width, size.height)
        guard longestSide > maxDimension else { return self }

        let scale = maxDimension / longestSide
        let newSize = CGSize(
            width: size.width * scale,
            height: size.height * scale
        )

        let format = UIGraphicsImageRendererFormat.default()
        format.scale = 1

        return UIGraphicsImageRenderer(size: newSize, format: format).image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
}

/// Creates a centered message for an empty list or grid.
func emptyStateLabel(_ message: String) -> UILabel {
    let label = UILabel()
    label.text = message
    label.numberOfLines = 0
    label.textAlignment = .center
    label.textColor = .secondaryLabel
    label.font = .preferredFont(forTextStyle: .body)
    return label
}
