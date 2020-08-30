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

class ExerciseContainer: UIViewController {
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  lazy var pagesvc: UIPageViewController = {
    let vc = UIPageViewController(
      transitionStyle: .scroll,
      navigationOrientation: .horizontal,
      options: nil
    )
    vc.dataSource = self
    vc.setViewControllers(
      [controllers.first!],
      direction: .forward,
      animated: false,
      completion: nil
    )
    addChild(vc)
    return vc
  }()
  lazy var controllers: [UIViewController] =
    [
      DetailsPage(exercise: exercise),
      HistoryPage(),
    ]
  var idx = 0

  private let level: Level
  private let exercise: Exercise

  init(level: Level, exercise: Exercise) {
    self.level = level
    self.exercise = exercise
    super.init(nibName: nil, bundle: nil)

    let appearance = UIPageControl.appearance()
    appearance.pageIndicatorTintColor = Kite.color.inactive
    appearance.currentPageIndicatorTintColor = Kite.color.active
  }

  override func loadView() {
    let view = Kite.views.background()
    view.directionalLayoutMargins = Kite.margins.directional

    let title = Kite.largeTitle(text: exercise.name)
    let levelv = Kite.caption(text: "Level \(level.id)")
    let pagesv = pagesvc.view!
    pagesv.translatesAutoresizingMaskIntoConstraints = false
    view.addSubviews(title, levelv, pagesv)

    let readable = view.readableContentGuide

    NSLayoutConstraint.activate([
      levelv.lastBaselineAnchor.constraint(equalTo: title.topAnchor, constant: Kite.space.small),
      levelv.leadingAnchor.constraint(equalTo: readable.leadingAnchor),

      title.topAnchor.constraint(equalTo: readable.topAnchor),
      title.leadingAnchor.constraint(equalTo: readable.leadingAnchor),

      pagesv.topAnchor.constraint(equalTo: title.lastBaselineAnchor, constant: Kite.space.medium),
      pagesv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      pagesv.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      pagesv.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])

    self.view = view
  }
}

extension ExerciseContainer: UIPageViewControllerDataSource {
  func pageViewController(
    _ pageViewController: UIPageViewController,
    viewControllerBefore viewController: UIViewController
  ) -> UIViewController? {
    let first = controllers.first!
    if viewController == first {
      return nil
    } else {
      idx = 0
      return first
    }
  }

  func pageViewController(
    _ pageViewController: UIPageViewController,
    viewControllerAfter viewController: UIViewController
  ) -> UIViewController? {
    let last = controllers.last!
    if viewController == last {
      return nil
    } else {
      idx = 1
      return last
    }
  }

  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    2
  }

  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return idx
  }
}
