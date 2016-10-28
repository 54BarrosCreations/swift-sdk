/**
 * Copyright IBM Corporation 2016
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import RestKit

/** A term from the request that was identified as an intent. */
public struct Intent: JSONEncodable, JSONDecodable {
    
    /// The name of the recognized intent.
    public let intent: String?
    
    /// The confidence score of the intent, between 0 and 1.
    public let confidence: Double?
    
    /**
     Create an `Intent`.

     - parameter intent: The name of the recognized intent.
     - parameter confidence: The confidence score of the intent, between 0 and 1.
     */
    init(intent: String?, confidence: Double?) {
        self.intent = intent
        self.confidence = confidence
    }
    
    /// Used internally to initialize an `Intent` model from JSON.
    public init(json: JSON) throws {
        intent = try? json.getString(at: "intent")
        confidence = try? json.getDouble(at: "confidence")
    }
    
    /// Used internally to serialize an `Intent` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        if let intent = intent {
            json["intent"] = intent
        }
        if let confidence = confidence {
            json["confidence"] = confidence
        }
        return json
    }
}
