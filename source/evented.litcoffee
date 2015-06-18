# CLASS: Evented
* Extends: [Node][Node]

Event broadcaster, dispatcher and receiver

    module.exports = class Evented extends require './base'

## CONSTRUCTOR

**new Evented(args)**

Creates [Evented][Evented] instance.

      constructor: -> super

### PARAMETERS
**args**
* Type: [Object][Object] - named arguments

## PROPERTIES

### #
* Type: [Object][Object]

## METHODS

### #toString()
* Returns: [String][String] - `'[object Evented]'`

[Node]: ./node.litcoffee
[Evented]: ./evented.litcoffee
[Object]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object
[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
