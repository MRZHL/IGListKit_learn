# IGListKit_learn
学校IGListKit

## 总结
### 添加字体需要在plist文件中声明
```
<key>UIAppFonts</key>
<array>
       <string>OCRAStd.otf</string>
</array>
```
### 自定义的 UINavigationBar 还挺好看

```
let nav = UINavigationController(navigationBarClass: CustomNavigationBar.self, toolbarClass: nil)
```
###  bool 有个 toggle 方法挺有意思
```
 /// Toggles the Boolean variable's value.
    ///
    /// Use this method to toggle a Boolean value from `true` to `false` or from
    /// `false` to `true`.
    ///
    ///     var bools = [true, false]
    ///
    ///     bools[0].toggle()
    ///     // bools == [false, false]
    @inlinable public mutating func toggle()
```
### 计算Label的高度
```
public struct TextSize {
  private struct CacheEntry: Hashable, Equatable {
    let text: String
    let font: UIFont
    let width: CGFloat
    let insets: UIEdgeInsets
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(text)
      hasher.combine(width)
      hasher.combine(insets.top)
      hasher.combine(insets.left)
      hasher.combine(insets.bottom)
      hasher.combine(insets.right)
    }
    
    static func ==(lhs: TextSize.CacheEntry, rhs: TextSize.CacheEntry) -> Bool {
      return lhs.width == rhs.width && lhs.insets == rhs.insets && lhs.text == rhs.text
    }
  }
  
  // 要把自定义的Struct 当作key 需要实现hash
  private static var cache: [CacheEntry: CGRect] = [:] {
    didSet {
      assert(Thread.isMainThread)
    }
  }
  
  public static func size(_ text: String, font: UIFont, width: CGFloat, insets: UIEdgeInsets = .zero) -> CGRect {
    let key = CacheEntry(text: text, font: font, width: width, insets: insets)
    if let hit = cache[key] {
      return hit
    }
    
    let constrainedSize = CGSize(width: width - insets.left - insets.right, height: .greatestFiniteMagnitude)
    let attributes = [NSAttributedString.Key.font: font]
    let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
    var bounds = (text as NSString).boundingRect(with: constrainedSize, options: options, attributes: attributes, context: nil)
    bounds.size.width = width
    bounds.size.height = ceil(bounds.height + insets.top + insets.bottom)
    cache[key] = bounds
    return bounds
  }
}


```
