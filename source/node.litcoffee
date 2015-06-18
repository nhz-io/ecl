# CLASS: Node
* Extends: [Base][Base]

Hierarchical tree structure.

    module.exports = class Node extends require './base'

## CONSTRUCTOR

**new Node(args)**

Creates [Node][Node] instance.

      constructor: -> super

### PARAMETERS
**args**
* Type: [Object][Object] - named arguments

## PROPERTIES

### #
* Type: [Object][Object]

## METHODS

### #toString()
* Returns: [String][String] - `'[object Node]'`

[Base]: ./base.litcoffee
[Node]: ./node.litcoffee
[Object]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object
[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
