# ecl    

## CLASSES
* [Base][Base] - superclass
* [Node][Node] - hierarchy
* [Event][Event] - container
* [Evented][Evented] - broadcaster/dispatcher/receiver    

---

### EXPORTS  

    module.exports =
      Base    : require './base'
      Node    : require './node'
      Event   : require './event'
      Evented : require './evented'

[Base]: ./base.litcoffee
[Node]: ./node.litcoffee
[Event]: ./event.litcoffee
[Evented]: ./evented.litcoffee
