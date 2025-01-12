//
//  TransformItem.swift
//  lottie-swift
//
//  Created by Brandon Withrow on 1/8/19.
//

import Foundation

/// An item that define an ellipse shape
final class ShapeTransform: ShapeItem {
  
  /// Anchor Point
  let anchor: KeyframeGroup<Vector3D>
  
  /// Position
  let position: KeyframeGroup<Vector3D>
  
  /// Scale
  let scale: KeyframeGroup<Vector3D>
  
  /// Rotation
  let rotation: KeyframeGroup<Vector1D>
  
  /// opacity
  let opacity: KeyframeGroup<Vector1D>
  
  /// Skew
  let skew: KeyframeGroup<Vector1D>
  
  /// Skew Axis
  let skewAxis: KeyframeGroup<Vector1D>
  
  private enum CodingKeys : String, CodingKey {
    case anchor = "a"
    case position = "p"
    case scale = "s"
    case rotation = "r"
    case opacity = "o"
    case skew = "sk"
    case skewAxis = "sa"
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ShapeTransform.CodingKeys.self)
    self.anchor = try container.decodeIfPresent(KeyframeGroup<Vector3D>.self, forKey: .anchor) ?? KeyframeGroup(Vector3D(x: Double(0), y: 0, z: 0))
    self.position = try container.decodeIfPresent(KeyframeGroup<Vector3D>.self, forKey: .position) ?? KeyframeGroup(Vector3D(x: Double(0), y: 0, z: 0))
    self.scale = try container.decodeIfPresent(KeyframeGroup<Vector3D>.self, forKey: .scale) ?? KeyframeGroup(Vector3D(x: Double(100), y: 100, z: 100))
    self.rotation = try container.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .rotation) ?? KeyframeGroup(Vector1D(0))
    self.opacity = try container.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .opacity) ?? KeyframeGroup(Vector1D(100))
    self.skew = try container.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .skew) ?? KeyframeGroup(Vector1D(0))
    self.skewAxis =  try container.decodeIfPresent(KeyframeGroup<Vector1D>.self, forKey: .skewAxis) ?? KeyframeGroup(Vector1D(0))
    try super.init(from: decoder)
  }
  
  override func encode(to encoder: Encoder) throws {
    try super.encode(to: encoder)
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(anchor, forKey: .anchor)
    try container.encode(position, forKey: .position)
    try container.encode(scale, forKey: .scale)
    try container.encode(rotation, forKey: .rotation)
    try container.encode(opacity, forKey: .opacity)
    try container.encode(skew, forKey: .skew)
    try container.encode(skewAxis, forKey: .skewAxis)
  }
  
  required init(dictionary: [String : Any]) throws {
    if let anchorDictionary = dictionary[CodingKeys.anchor.rawValue] as? [String: Any],
       let anchor = try? KeyframeGroup<Vector3D>(dictionary: anchorDictionary) {
      self.anchor = anchor
    } else {
      self.anchor = KeyframeGroup(Vector3D(x: Double(0), y: 0, z: 0))
    }
    if let positionDictionary = dictionary[CodingKeys.position.rawValue] as? [String: Any],
       let position = try? KeyframeGroup<Vector3D>(dictionary: positionDictionary) {
      self.position = position
    } else {
      self.position = KeyframeGroup(Vector3D(x: Double(0), y: 0, z: 0))
    }
    if let scaleDictionary = dictionary[CodingKeys.scale.rawValue] as? [String: Any],
       let scale = try? KeyframeGroup<Vector3D>(dictionary: scaleDictionary) {
      self.scale = scale
    } else {
      self.scale = KeyframeGroup(Vector3D(x: Double(100), y: 100, z: 100))
    }
    if let rotationDictionary = dictionary[CodingKeys.rotation.rawValue] as? [String: Any],
       let rotation = try? KeyframeGroup<Vector1D>(dictionary: rotationDictionary) {
      self.rotation = rotation
    } else {
      self.rotation = KeyframeGroup(Vector1D(0))
    }
    if let opacityDictionary = dictionary[CodingKeys.opacity.rawValue] as? [String: Any],
       let opacity = try? KeyframeGroup<Vector1D>(dictionary: opacityDictionary) {
      self.opacity = opacity
    } else {
      self.opacity = KeyframeGroup(Vector1D(100))
    }
    if let skewDictionary = dictionary[CodingKeys.skew.rawValue] as? [String: Any],
       let skew = try? KeyframeGroup<Vector1D>(dictionary: skewDictionary) {
      self.skew = skew
    } else {
      self.skew = KeyframeGroup(Vector1D(0))
    }
    if let skewAxisDictionary = dictionary[CodingKeys.skewAxis.rawValue] as? [String: Any],
       let skewAxis = try? KeyframeGroup<Vector1D>(dictionary: skewAxisDictionary) {
      self.skewAxis = skewAxis
    } else {
      self.skewAxis = KeyframeGroup(Vector1D(0))
    }
    try super.init(dictionary: dictionary)
  }
  
}
