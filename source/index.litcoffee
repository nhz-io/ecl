# ecl

## Evented Components Library [![Build Status][travis-image]][travis-url]
[![NPM][npm-image]][npm-url]

**Instant hierarchical tree structure with event delivery mechanism.**

## Browser
* [ecl.js][dist-browser-js-url]
* [ecl.min.js][min-dist-browser-js-url]

## Node
```
npm install --save ecl
```

## Build
```
git clone https://github.com/nhz-io/ecl.git
cd ecl
npm install
gulp
```

## Classes
* [Base][Base] - superclass
* [Node][Node] - hierarchy
* [Event][Event] - container
* [Evented][Evented] - broadcaster/dispatcher/receiver

## Tests
* [Base][BaseTest]
* [Node][NodeTest]
* [Event][EventTest]
* [Evented][EventedTest]

## Exports

    module.exports =
      Base    : require './base'
      Node    : require './node'
      Event   : require './event'
      Evented : require './evented'

## Benchmark
###  [JSPERF][jsperf-url]

## LICENSE

**[MIT](LICENSE)**

###VERSION
**0.0.1**

[travis-image]: https://travis-ci.org/nhz-io/ecl.svg
[travis-url]: https://travis-ci.org/nhz-io/ecl

[npm-image]: https://nodei.co/npm/ecl.png
[npm-url]: https://nodei.co/npm/ecl

[jsperf-url]: http://jsperf.com/ecl

[dist-browser-js-url]: https://raw.githubusercontent.com/nhz-io/cnl/master/ecl.js
[min-dist-browser-js-url]: https://raw.githubusercontent.com/nhz-io/cnl/master/cnl.min.js

[Base]: ./base.litcoffee
[Node]: ./node.litcoffee
[Event]: ./event.litcoffee
[Evented]: ./evented.litcoffee

[BaseTest]: ./test/base.litcoffee
[NodeTest]: ./test/base.litcoffee
[EventTest]: ./test/event.litcoffee
[EventedTest]: ./test/evented.litcoffee
