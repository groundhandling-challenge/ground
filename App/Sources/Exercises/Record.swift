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

import CoreLocation
import Foundation

struct Record: Codable {
  let date: Date
  let exerciseId: ExerciseId
  let wing: Wing
  var placemark: Placemark?
  var conditions: Conditions?
  var windAngle: Measurement<UnitAngle>?
  var temperature: Measurement<UnitTemperature>?
  var comment: String?

  init(
    date: Date = Date(),
    exerciseId: ExerciseId,
    wing: Wing,
    placemark: Placemark? = nil,
    conditions: Conditions? = nil,
    comment: String? = nil
  ) {
    self.date = date
    self.exerciseId = exerciseId
    self.wing = wing
    self.placemark = placemark
    self.conditions = conditions
    self.comment = comment
  }
}
