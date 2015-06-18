# CLASS: Event

    module.exports = class Event extends require './base'

## CONSTRUCTOR

**new Event(type)**
**new Event(type, callback)**
**new Event(args)**
**new Event(args, callback)**

Creates [Event][Event] instance.

      constructor: -> super

### PARAMETERS
**type**
* Type: [String][String] - **mandatory** event type.

**callback**
* Type: [Function][Function] - **optional** event end callback.

**args**
* Type: [Object][Object] - named arguments

## PROPERTIES

### #
* Type: [Object][Object]

## METHODS

### #toString()
* Returns: [String][String] - `'[object Event]'`

[Base]: ./base.litcoffee
[Object]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object
[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
