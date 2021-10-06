# SwiftUI LazyVGrid Performance Example

>A simple app to illustrate the performance problem with `.sheet()` Modifier inside `LazyVGrid`.

This is an app that allows you to place orders for multiple people. The orders are displayed in a table. Each row corresponds to one person. The columns then contain the information for the persons, i.e. name, options and then the various elements that can be ordered. Each element has its own column. In addition, a date picker can be used to change the date for the order. For each day there are different elements that can be ordered (daily changing items).

The representation of the table is done via a `LazyVGrid`, which gets a dynamic number of columns, corresponding to the elements to be ordered. This is done in the initializer of the view.

Each of these elements is a separate view. These individual "order views" have a toggle, which selects or deselects the element. But each "order view" has also a `.sheet()` modifier and exactly this one causes problems. If you change the day, the loading time gets longer with each additional day.
The representation of the table is done via a `LazyVGrid`, which gets a dynamic number of columns, corresponding to the elements to be ordered. This is done in the initializer of the view.
