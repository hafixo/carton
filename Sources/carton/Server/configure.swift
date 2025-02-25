// Copyright 2020 Carton contributors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
import Vapor

// configures your application
public func configure(_ app: Application, mainWasmPath: String) throws {
  let directory = FileManager.default.homeDirectoryForCurrentUser
    .appendingPathComponent(".carton")
    .appendingPathComponent("static")
    .path
  app.middleware.use(FileMiddleware(publicDirectory: directory))

  // register routes
  try routes(app, mainWasmPath: mainWasmPath)
}
