# ecl tests
* Parent: [Index][Parent]

## [Base Test][BaseTest]
Run on [Base][Base], [Event][Event], [Node][Node] and [Evented][Evented]

    test = require './base'
    test (require '../base'), 'Base'
    test (require '../event'), 'Event'
    test (require '../node'), 'Node'
    test (require '../evented'), 'Evented'

## [Event Test][EventTest]

    test = require './event'
    test (require '../event'), 'Event'

## [Node Test][NodeTest]
Run on [Node][Node] and [Evented][Evented]

    test = require './node'
    test (require '../node'), 'Node'
    test (require '../evented'), 'Evented'

## [Evented Test][EventedTest]

    test = require './evented'
    test (require '../evented'), 'Evented'

[Base]: ../base.litcoffee
[BaseTest]: ./base.litcoffee

[Event]: ../event.litcoffee
[EventTest]: ./event.litcoffee

[Node]: ../node.litcoffee
[NodeTest]: ./node.litcoffee

[Evented]: ../evented.litcoffee
[EventedTest]: ./evented.litcoffee
[Parent]: ../index.litcoffee
