
<img src="https://user-images.githubusercontent.com/274971/27063828-68d6036a-4fca-11e7-9785-28c4db790497.jpg" width="1024">

![Swift 3.1](https://img.shields.io/badge/Swift-3.1-orange.svg?style=flat)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Cocoapods v0.0.2](https://img.shields.io/cocoapods/v/Recycle.svg?style=flat)
![MIT License](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)

Recycle is a swift module for iOS that helps reusing `UITableView` and `UICollectionView` cells and views. It's more clear and less verbose than the native counterparts.

# Why should I use it?
If you're tired of spending dozens of lines registering cells and then casting all dequeued ones, this module is for you.

You will improve cell registering:
```swift
// From this:
let nibOne = UINib(nibName: "MyFileOne", bundle: self.bundle)
let cellOne = tableView.register(nib, forCellWithReuseIdentifier: "cellOne")

let nibTwo = UINib(nibName: "MyFileTwo", bundle: self.bundle)
let cellTwo = tableView.register(nib, forCellWithReuseIdentifier: "cellTwo")

// To this:
tableview.registerRecyclableCells(CellOne.self, CellTwo.self)
```

And improve cell reuse:
```swift
// From this:
let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne") as? CellOne ?? CellOne()

// To this:
let cell = tableView.recycle(CellOne.self)
```

That's plenty of reason to me :)

-----

# Table of contents

**Get started**
- [Install with Cocoapods](#install-with-cocoapods)
- [Install with Carthage](#install-with-carthage)

**UITableViewCell**
- [Creating a recyclable UITableViewCell](#creating-a-recyclable-uitableviewcell)
- [Registering recyclable UITableViewCell](#registering-recyclable-uitableviewcell)
- [Recycling a UITableViewCell](#recycling-a-uitableviewcell)

**UITableViewHeaderFooterView**
- [Creating a recyclable UITableViewHeaderFooterView](#creating-a-recyclable-uitableviewheaderfooterview)
- [Registering recyclable UITableViewHeaderFooterView](#registering-recyclable-uitableviewheaderfooterview)
- [Recycling a UITableViewHeaderFooterView](#recycling-a-uitableviewheaderfooterview)

**UICollectionViewCell**
- [Creating a recyclable UICollectionViewCell](#creating-a-recyclable-uicollectionviewcell)
- [Registering recyclable UICollectionViewCell](#registering-recyclable-uicollectionviewcell)
- [Recycling a UICollectionViewCell](#recycling-a-uicollectionviewcell)

**UICollectionReusableView**
- (coming soon)

**Configuring recyclable cells and views**
- [Using a xib](#using-a-xib)
- [Custom bundle](#custom-bundle)
- [Custom identifier](#custom-identifier)

----

# Get started
Add Recycle as a dependency to your project!

### Install with Cocoapods
Add this to your Podfile and do a `pod install`:

```ruby
pod 'Recycle', '~> 0.0.2'
```


### Install with Carthage
Add this to your cartfile and do a `carthage update`:
```ruby
github "mateusnroll/recycle" ~> 0.0.2
```


-----

# UITableViewCell
Recycle extends the UITableView adding `registerRecyclableCells` and `Recycle` functions. Both accept cells that conform to the `Recyclable` protocol.

### Creating a recyclable UITableViewCell

The cell class should inherint from `UITableViewCell` and use the `Recyclable` mixin.

```swift
import Recycle

class CellOne: UITableViewCell, Recyclable {

}
```

### Registering recyclable UITableViewCell

`tableView.registerRecyclableView(cells: Reusable.Type...)`

Registering cells should be done when you first load the view, ideally on `viewDidLoad`. This will avoid trying to recycle something that has not been registered yet. You can register as many cells as you want, using the variadic parameter.

```swift
overrid func viewDidLoad() {
    super.viewDidLoad()
    tableView.registerRecyclableCells(CellOne.self, CellTwo.self, CellThree.self)
    // ... More code
}
```

### Recycling a UITableViewCell

This can be used anywhere, but will probably be used on `tableView(_ tableView:, cellForRowAt indexPath:)`, hence the example. The `recycle` function will always return the same type it is passed but optional, which means there's no need for casting.

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.recycle(CellOne.self)
        return cell ?? UITableViewCell()
    }
```


------

# UITableViewHeaderFooterView
Recycle extends the UITableView to add `registerRecyclableHeaderFooterViews` and `recycleHeaderFooter` functions. Both accept views that conform to the `Recyclable` protocol.

### Creating a recyclable UITableViewHeaderFooterView
The view class should inherint from `UITableViewHeaderFooterView` and use the `Recyclable` mixin.

```swift
import Recycle

class HeaderOne: UITableViewHeaderFooterView, Recyclable {

}
```

### Registering recyclable UITableViewHeaderFooterView

`tableView.registerRecyclableHeaderFooterViews(views: Reusable.Type...)`

Registering views should be done when you first load the cotroller view, ideally on `viewDidLoad`. You can register as many views as you want, using the variadic parameter.

```swift
overrid func viewDidLoad() {
    super.viewDidLoad()
    tableView.registerRecyclableHeaderFooterViews(HeaderOne.self, HeaderTwo.self, HeaderThree.self)
    // ... More code
}
```

### Recycling a UITableViewHeaderFooterView

This can be used anywhere, but will probably be used on `tableView(_ tableView:, viewForHeaderInSection section:)`, hence the example. The `recycle` function will always return the same type it is passed but optional, which means there's no need for casting.

```swift
override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return tableView.recycleHeaderFooter(HeaderOne.self)
}
```

----

# UICollectionViewCell
Recycle extends the UICollectionView to add `registerRecyclableCells` and `recycle` functions. Both accept cells that conform to the `Recyclable` protocol.

### Creating a recyclable UICollectionViewCell
The view class should inherint from `UICollectionViewCell` and use the `Recyclable` mixin.

```swift
import Recycle

class CollectionCellOne: UICollectionViewCell, Recyclable {

}
```

### Registering recyclable UICollectionViewCell

`collectionView.registerRecyclableCells(cells: Reusable.Type...)`

Registering cells should be done when you first load the view, ideally on `viewDidLoad`. You can register as many cells as you want, using the variadic parameter.

```swift
overrid func viewDidLoad() {
    super.viewDidLoad()
    tableView.registerRecyclableCells(CollectionCellOne.self, CollectionCellTwo.self, CollectionCellThree.self)
    // ... More code
}
```

### Recycling a UICollectionViewCell

This can be used anywhere, but will probably be used on `collectionView(_ collectionView:, cellForItemAt indexPath:)`, hence the example. The `recycle` function will always return the same type it is passed but optional, which means there's no need for casting.

```swift
override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.recycle(CollectionCellOne.self, for: indexPath)
    return cell ?? UICollectionViewCell()
}
```


----

# Configuring recyclable cells and views

All cells and views that conform to the `Recyclable` protocol will have some properties inferred. You can take a look at them and maybe overwrite some. The demos below are for `UITableViewCell`, but it can be applied to any of the supported types.

### Using a xib

To use it with a nib, just create it with a file name equal to the class (`CellOne.xib`), and add the class as the cell's custom class. Cells that don't have a `xib` will be configured without it.

To configure a custom `xib` filename, set the class' `nibName` property. Don't add the `.xib` extension.

```swift
import Recycle

class CellOne: UITableViewCell, Recyclable {
    static var nibName: String? = "MyNibFilename"
}
```

### Custom bundle

To configure a custom bundle, se the class' `bundle` property. The default is `nil`.

```swift
import Recycle

class CellOne: UITableViewCell, Recyclabe {
    static var bundle: Bundle? = Bundle(for: CellOne.self)
}
```

### Custom identifier

The cell's identifier will be the its class name as a string. To configure a custom one, set the class' `identifier` property.

```swift
import Recycle

class CellOne: UITableViewCell, Recyclabe {
    static var identifier: String = "MyCustomIdentifier"
}
```
