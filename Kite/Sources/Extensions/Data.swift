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

import Foundation

extension Data {
  public func compressed() throws -> Data {
    let nsdata = NSData(data: self)
    return try nsdata.compressed(using: .lzfse) as Data
  }

  public func decompressed() throws -> Data {
    let nsdata = NSData(data: self)
    return try nsdata.decompressed(using: .lzfse) as Data
  }
}
