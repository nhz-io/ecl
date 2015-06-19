# CLASS: Event
* Extends: [Base][Base]
* Parent: [Index][Parent]

    module.exports = class Event extends require './base'

Events are broadcasted down the hierarchy tree (from parents to children),
in attempt to reach the event target and get dispatched to listeners.

On their travel path, the events are being captured and dispatched 
to the capturing listeners.

After the event has reached the target,  it might start bubbling up
the hierarchy tree depending on the settings.

There are three ways to control event propagation
* **Cancel** - stop the current dispatcher
* **Stop** - do not broadcast the event to children
* **Abort** - completely halt event propagation.

When event does not propagate anymore, event **callback** will be called.

---

## CONSTRUCTOR

Creates [Event][Event] instance.

### new Event(type)
### new Event(callback)
### new Event(type, callback)
### new Event(args)

Create Event instance.

      constructor: (type, callback) ->

Create named arguments object.

        args = (if typeof type is 'string' then type:type else type or {})

`callback` argument overrides the `args.callback`

        if typeof callback is 'function' then args.callback = callback

Call `super` to initialize #___runtime and copy properties.

        super args

If enabled, calculate the creation timestamp
        
        if @timestamp is true
          date = Date.now()

with high precision

          perf = performance?.now() or 0
          @timestamp = 1000 * date + Math.floor 1000 * (perf - Math.floor perf)

#### PARAMETERS
**type**
* Type: [String][String] - **mandatory** event type.
* Dispatchers and broadcasters will ignore events without a type

**callback**
* Type: [Function][Function] - **optional** completion callback
* Will be called with event instance as `this` and first argument

**args**
* Type: [Object][Object] - named arguments

**args.target**
* Type: [Evented][Evented] - **optional** event target.

**args.timestamp**
* Type: [Number][Number] - override the timestamp
* Type: [Boolean][Boolean] - set to `true` to enable timestamp calculation

---

## PROPERTIES
### #type
* Type: [String][String] - type

### #timestamp
* Type: [Number][Number] - creation timestamp

### #phase
* Type: [String][String] - lifecycle phase

### #callback
* Type: [Function][Function] - completion callback

### #aborted
* Type: [Boolean][Boolean] - aborted flag

---

## METHODS

### #cancel()
* Returns: [Evented][Evented]

Cancel event dispatching
      
      cancel: ->
        @___runtime.cancel = true
        return this

---

### #stop()
* Returns: [Evented][Evented]

Stop event broadcasting
  
      stop: ->
        @___runtime.stop = true
        return this

---

### #abort()
* Returns: [Evented][Evented]

Abort event propagation
    
      abort: ->
        @aborted = true
        return this

[Base]: ./base.litcoffee
[Event]: ./event.litcoffee
[Evented]: ./base.litcoffee

[Function]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function
[Object]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object
[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
[Number]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number
[Boolean]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean
[Parent]: ./index.litcoffee
