<img src="https://user-images.githubusercontent.com/274971/27062268-44ab1958-4fc0-11e7-8808-8fe5ade604a2.png" width="190">

Recycle is a swift module to help reusing `UITableView` and `UICollectionView` cells and views. It's more clear and less verbose than the native couterparts.

### Table of contents

**UITableView Cells**

- Creating a recyclable cell
- Registering cells
- Recycling cells

**UITableView HeaderFooterView**
- Creating reusable header/footer views
- Registering header/footer views
- Recycling header/footer views

**UICollectionView**

- Registering cells
- Registering reusable views
- Recycling cells
- Recycling reusable views

-----

# Creating a recyclable UITableViewCell

The cell class should inherint from `UITableViewCell` and use the `Recyclable` mixin.

```swift
class CellOne: UITableViewCell, Recyclable {

}
```

#### Using a xib

To use it with a nib, just create it with a file name equal to the class (`CellOne.xib`), and add the class as the cell's custom class. Cells that don't have a `xib` will be configured without it.

To configure a custom `xib` filename, set the class' `nibName` property. Don't add the `.xib` extension.

```swift
class CellOne: UITableViewCell, Recyclable {
    static var nibName: String? = "MyNibFilename"
}
```

#### Custom bundle

To configure a custom bundle, se the class' `bundle` property. The default is `nil`.

```swift
class CellOne: UITableViewCell, Recyclabe {
    static var bundle: Bundle? = Bundle(for: CellOne.self)
}
```

#### Custom identifier

The cell's identifier will be the its class name as a string. To configure a custom one, set the class' `identifier` property.

```swift
class CellOne: UITableViewCell, Recyclabe {
    static var identifier: String = "MyCustomIdentifier"
}
```


# Registering recyclable UITableViewCell(s)

`tableView.registerRecyclableView(cells: Reusable.Type...)`

Registering cells should be done when you first load the view, ideally on `viewDidLoad`. This will avoid trying to recycle something that has not been registered yet. You can register as many cells as you want, using the variadic parameter.

```swift
overrid func viewDidLoad() {
    super.viewDidLoad()
    tableView.registerRecyclableCells(CellOne.self, CellTwo.self, CellThree.self)
    // ... More code
}
```

# Recycling a UITableViewCell


This can be used anywhere, but will probably be used on `tableView(_ tableView:, cellForRowAt indexPath:)`, hence the example. The `recycle` function will always return the same time it is passed but optional, which means there's no need for casting.

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell?

        if indexPath.row == 0 {
            cell = tableView.recycle(CellOne.self)
        } else if indexPath.row == 1 {
            cell = tableView.recycle(CellTwo.self)
        } else {
            cell = nil
        }

        return cell ?? UITableViewCell()
    }
```
