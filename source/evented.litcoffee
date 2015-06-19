# CLASS: Evented
* Extends: [Node][Node]

Event broadcaster, dispatcher and receiver.

    Event = require './event'
    module.exports = class Evented extends require './node'

This class is implements an event delivery mechanism.

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

### #addListener(args)
### #addListener(type, listener, capture)
* Returns: [Evented][Evented]

Add a listener (capturing/normal) for the event type. Will not add duplicates. 
Will not add listeners if event is not enabled.

      addListener: (type, listener, capture = false) ->

Treat the **type** as named arguments if the object was passed

        if typeof type is 'object'  then {type, listener, capture} = type

If event type is enabled and **listener** is a function

        if @events[type] and typeof listener is 'function'

get the listeners for this type and phase or initialize them if they does not exist

          listeners = (@listeners[if capture then 1 else 0]?[type] or= [])

add the **listener** to listeners if it isnt already there

          listeners.push listener if -1 is listeners.indexOf listener

        return this

#### PARAMETERS
**type**
* Type: [String][String] - event type

**listener**
* Type: [Function][Function] - event listener

**capture**
* Type: [Boolean][Boolean] - capturing/non-capturing flag
* Default: `false`

**args**
* Type: [Object][Object] - named arguments

### #removeListener(args)
### #removeListener(type, listener, capture)
* Returns: [Evented][Evented]

Remove the listener (capturing/normal) for the event type.

      removeListener: (type, listener, capture = false) ->

Treat the **type** as named arguments if the object was passed

        if type instanceof Object then {type, listener, capture} = type

Get the listeners for the event type and phase and remove the **listener** if it exists.

        if type and typeof listener is 'function'
          if listeners = @listeners[if capture then 1 else 0]?[type]
            if -1 isnt idx = listeners.indexOf listener
              listeners.splice idx, 1

        return this

#### PARAMETERS
**type**
* Type: [String][String] - event type

**listener**
* Type: [Function][Function] - event listener

**capture**
* Type: [Boolean][Boolean] - capturing/non-capturing flag
* Default: `false`

**args**
* Type: [Object][Object] - named arguments

### #dispatchEvent(event)
* Returns: [Evented][Evented]

Dispatch the event to listeners.

      dispatchEvent: (event) ->

Make sure event can be dispatched

        unless event.aborted or event.canceled

Find out the event type and if it is enabled

          if (type = event?.type) and @events[type]

grab the event phase and correct it to be able to load the listeners.

            phase = (if event.phase > 2 then 2 else event.phase)

Check if the phase allows dispatching and get the event listeners for event type and phase

            if (3 > phase > 0) and listeners = @listeners?[2-phase][type]

Dispatch the event to every listener. If inside some listener event gets canceled or aborted
the dispatching will stop at that listener.

              for listener in listeners
                break if event.___runtime?.canceled or event.aborted
                listener.call this, event

        return this

#### PARAMETERS
**event**
* Type: [Event][Event] - event to dispatch

### #broadcastEvent(event)
* Returns: [Evented][Evented]

Process the event, dispatch it to listeners and broadcast to children.

      broadcastEvent: (event) ->

No action will be taken if event has no type. This method
will initialize fresh events. 
Only broadcast events that have a type. Event source will be
set to this instance if event has no source. Event target
can be changed by providing it as second argument to broadcast.

        if type = event?.type
          unless event.aborted or event.done or event.phase is 3
            event.start()
            event.source ||= this
            phase = (event.phase ||= 1)

If event target is this instance, it means event has reached it's
destination. Event phase is set to 2 (AT_TARGET)

            if event.target is this then event.phase = 2

If event phase is 1 (CAPTURING), the event will be dispatched to
this instance. After that, the event will be dispatched to every
while the phase remains CAPTURING and event was not aborted.

            if event.phase is 1
              @dispatchEvent event

              if @children then for child in @children
                if event.phase is 1 and not event.aborted
                  child.broadcastEvent event
                else break

After dispatching was finished, it may be possible that the event
target was changed. If the event target is this instance, the
event phase will be set to AT_TARGET and the event will be dispatched
again.

            if event.target is this then event.phase = 2

            if event.phase is 2 then @dispatchEvent event

At this point the event has finished it's lifecycle. If event.source
is this instance, so the event callback will be called if the
event was not aborted or finished or canceled.

            if event.source is this
              unless event.canceled or event.aborted or event.done or event.phase is 3
                event.callback?.call? this, event
              event.phase = 3
              event.finish()
        return this

#### PARAMETERS
**event**
* Type: [Event][Event] - event to broadcast

[Node]: ./node.litcoffee
[Event]: ./event.litcoffee
[Evented]: ./evented.litcoffee
[Object]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object
[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
[Function]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function
