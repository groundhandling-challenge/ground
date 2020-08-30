//  Copyright (C) 2020 Nick Platt <platt.nicholas@gmail.com>
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.

import UIKit

class DetailsPage: UIViewController {
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private let exercise: Exercise

  init(exercise: Exercise) {
    self.exercise = exercise
    super.init(nibName: nil, bundle: nil)
  }

  override func loadView() {
    let view = Kite.views.background()

    let scrollv = UIScrollView(frame: .zero)
    scrollv.pin(to: view)

    let contentv = UIView(frame: .zero)
    contentv.directionalLayoutMargins = Kite.margins.directional
    contentv.pin(to: scrollv)

    let image = Kite.views.image(named: exercise.id)
    let desc = Kite.body(text: exercise.desc)
    contentv.addSubviews(image, desc)

    let readable = contentv.readableContentGuide

    NSLayoutConstraint.activate([
      contentv.widthAnchor.constraint(equalTo: scrollv.widthAnchor),

      image.topAnchor.constraint(equalTo: contentv.topAnchor),
      image.leadingAnchor.constraint(equalTo: readable.leadingAnchor),
      image.heightAnchor.constraint(equalTo: image.widthAnchor),
      image.widthAnchor.constraint(equalTo: readable.widthAnchor, constant: -Kite.space.medium),

      desc.topAnchor.constraint(equalTo: image.bottomAnchor, constant: Kite.space.medium),
      desc.leadingAnchor.constraint(equalTo: readable.leadingAnchor),
      desc.trailingAnchor.constraint(equalTo: readable.trailingAnchor),
      desc.bottomAnchor.constraint(equalTo: contentv.bottomAnchor),
    ])

    self.view = view
  }
}
