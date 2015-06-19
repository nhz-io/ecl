# Test Evented Class
* Parent: [Test][Parent]

---

    should = require 'should'
    Node = require '../node'
    Event = require '../event'

    module.exports = (Evented, name = 'Evented') ->
      describe name, ->
        it 'should be a class', -> Evented.should.be.a.class
        describe '#constructor()', ->
          it 'should return an instance of Evented', ->
            (new Evented).should.be.an.instanceof Evented

        describe '#constructor()', ->
          it 'should return an instance of Evented', ->
            (new Evented).should.be.an.instanceof Evented

The Evented [constructor][Evented#constructor] should set the **#listeners**
to an array with two empty objects. For normal and for capturing listeners.

        describe '#listeners', ->
          it 'should be an array of two objects', ->
            (new Evented).listeners.length.should.be.equal 2
            (new Evented).listeners[0].should.be.an.Object
            (new Evented).listeners[1].should.be.an.Object

The [#addListener()][Event#addListener] method should add a **listener**
to the matching **phase** (capturing/normal) object, under and matching **type**
key.

        describe '#addListener(type, listener, capture = false)', ->
          it 'should return the evented', ->
            (test = new Evented).addListener().should.be.equal test

          it 'should add event listener to normal listeners (default)', ->
            (test = new Evented events:test:true)
              .addListener('test', (listener = ->))
              .listeners[0].test[0].should.be.equal listener

          it 'should add event listener to normal listeners (default) (named arguments)', ->
            (test = new Evented events:test:true)
              .addListener type:'test', listener:(listener = ->)
              .listeners[0].test[0].should.be.equal listener

          it 'should add event listener to capturing listeners', ->
            (test = new Evented events:test:true)
              .addListener('test', (listener = ->), yes)
              .listeners[1].test[0].should.be.equal listener

          it 'should add event listener to capturing listeners (named arguments)', ->
            (test = new Evented events:test:true)
              .addListener type:'test', listener:(listener = ->), capture:yes
              .listeners[1].test[0].should.be.equal listener

          it 'should not add duplicates', ->
            (test = new Evented events:test:true)
              .addListener('test', (listener = ->))
              .addListener('test', listener)
              .listeners[0].test.length.should.be.equal 1

            (test = new Evented events:test:true)
              .addListener('test', (listener = ->), yes)
              .addListener('test', listener, yes)
              .listeners[1].test.length.should.be.equal 1

          it 'should add only functions', ->
            (test = new Evented events:test:true)
              .addListener 'test', {}
              .listeners[0].should.not.have.property 'test'
            (test = new Evented events:test:true)
              .addListener 'test', {}, yes
              .listeners[1].should.not.have.property 'test'

The [#removeListener][Evented#removelistener] method should remove the **listener**
from the the matching **phase** (capturing/normal) object, under and matching **type**
key.

        describe '#removeListener(type, listener, capture = false)', ->
          it 'should return the Evented instance', ->

            (test = new Evented).removeListener().should.be.equal test

          it 'should remove the listener from normal listeners', ->
            (test = new Evented events:test:true)
              .addListener('test', (listener = ->))
              .removeListener('test', listener)
              .listeners[0].test.length.should.be.equal 0

          it 'should remove the listener from normal listeners (args)', ->
            (test = new Evented events:test:true)
              .addListener('test', (listener = ->))
              .removeListener type:'test', listener:listener
              .listeners[0].test.length.should.be.equal 0

          it 'should remove the listener from capturing listeners', ->
            (test = new Evented events:test:true)
              .addListener('test', (listener = ->), yes)
              .removeListener('test', listener, yes)
              .listeners[1].test.length.should.be.equal 0

          it 'should remove the listener from capturing listeners (args)', ->
            (test = new Evented events:test:true)
              .addListener('test', (listener = ->), yes)
              .removeListener type:'test', listener:listener, capture:yes
              .listeners[1].test.length.should.be.equal 0

The [#dispatchEvent][Evented#dispatchEvent] method should dispatch the event to the listeners

        describe '#dispatchEvent(event)', ->
          it 'should return the Evented instance', ->

            (test = new Evented).dispatchEvent().should.be.equal test

it should dispatch to **normal** listeners if the phase is AT_TARGET (2)

          it 'should dispatch the event to normal listeners when phase is AT_TARGET', ->
            count = 0
            (event = new Event 'test').phase = 2
            (new Evented events:test:true)
              .addListener 'test', -> count++
              .addListener 'test', -> count++
              .addListener 'test', -> count++
              .dispatchEvent event
            count.should.be.equal 3

it should dispatch to **capturing** listeners if the phase is CAPTURING (1)

          it 'should dispatch the event to capturing listeners', ->
            count = 0
            (event = new Event 'test').phase = 1
            (new Evented events:test:true)
              .addListener 'test', (-> count++), yes
              .addListener 'test', (-> count++), yes
              .addListener 'test', (-> count++), yes
              .dispatchEvent event
            count.should.be.equal 3

          it 'should not dispatch events in any other phase', ->
            pass = yes
            event = new Event 'test'
            test = new Evented events:test:true
            test
              .addListener 'test', (-> pass = no)
              .addListener 'test', (-> pass = no), yes
              .dispatchEvent event
            pass.should.be.ok

            event.phase = 3
            test.dispatchEvent event
            pass.should.be.ok

          it 'should not dispatch aborted events', ->
            pass = yes
            (event = new Event 'test').phase = 1
            event.abort()
            test = new Evented events:test:true
            test
              .addListener 'test', (-> pass = no)
              .addListener 'test', (-> pass = no), yes
              .dispatchEvent event
            pass.should.be.ok

            event.phase = 2
            test.dispatchEvent event
            pass.should.be.ok

The [#broadcastEvent][Evented#broadcastEvent] should process the event and dispatch it to listeners
if needed. After that, if its appropriate, the event should be broadcasted to the children.

        describe '#broadcastEvent(event)', ->
          it 'should return the Evented instance', ->
            (test = new Evented).broadcastEvent().should.be.equal test

          it 'should set event phase to capturing if phase is not truthly', ->
            pass = no
            (parent = new Evented events:test:true).appendChild(child = new Evented)
            (event = new Event 'test')
            child.broadcastEvent = (e) -> pass = (e.phase is 1)
            parent.broadcastEvent event
            pass.should.be.ok

          it 'should broadcast the event to children', ->
            pass = no
            (parent = new Evented events:test:true).appendChild(child = new Evented)
            child.broadcastEvent = -> pass = yes
            parent.broadcastEvent new Event 'test'
            pass.should.be.ok

          it 'should set the Evented instance as the event source if there is no source already', ->
            (test = new Evented events:test:true).broadcastEvent(event = new Event 'test')
            event.___runtime.source.should.be.equal test

When the event has reached it's target, or there is nowhere to broadcast the event anymore,
the event callback must be called

          it 'should not broadcast the event to children if this Evented instance is the target of the event', ->
            pass = yes
            (parent = new Evented events:test:true).appendChild(child = new Evented)
            (event = new Event 'test').target = parent
            child.broadcastEvent = -> pass = no
            parent.broadcastEvent event
            pass.should.be.ok

          it 'should not broadcast finished event to children', ->
            pass = yes
            (parent = new Evented events:test:true).appendChild(child = new Evented)
            (event = new Event 'test').phase = 4
            child.broadcastEvent = -> pass = no
            parent.broadcastEvent event
            pass.should.be.ok

          it 'should not broadcast aborted event to children', ->
            pass = yes
            (parent = new Evented events:test:true).appendChild(child = new Evented)
            (event = new Event 'test').abort()
            child.broadcastEvent = -> pass = no
            parent.broadcastEvent event
            pass.should.be.ok

After the event validation logic, and before broadcast to the children, the event must be
dispatched to the listeners.

          it 'should call dispatchEvent on this Evented instance before broadcasting it to children', ->
            broadcasted = no
            dispatched = no
            (parent = new Evented events:test:true).appendChild(child = new Evented)
            parent.dispatchEvent = -> dispatched = not broadcasted
            child.broadcastEvent = -> broadcasted = yes
            parent.broadcastEvent new Event 'test'
            broadcasted.should.be.ok
            dispatched.should.be.ok

          it 'should not call dispatchEvent if event is finished', ->
            pass = yes
            (parent = new Evented events:test:true).dispatchEvent = -> pass = no
            (event = new Event 'test').phase = 3
            parent.broadcastEvent event
            pass.should.be.ok

          it 'should not call dispatchEvent if event is aborted', ->
            pass = yes
            (parent = new Evented events:test:true).dispatchEvent = -> pass = no
            (event = new Event 'test').abort()
            parent.broadcastEvent event
            pass.should.be.ok

If the event has reached it's target, and bubbling is not enabled, then the event is considered
as **done**, and the event callback must be called.

          it 'should call event callback upon completion if event source is this Evented instance', ->
            pass = no
            (event = new Event 'test').callback = -> pass = yes
            event.target = (test = new Evented events:test:true)
            test.broadcastEvent event
            pass.should.be.ok

          it 'should not call event callback for finished events', ->
            pass = yes
            (event = new Event 'test').callback = -> pass = no
            event.phase = 4
            event.target = (test = new Evented events:test:true)
            test.broadcastEvent event
            pass.should.be.ok

[Evented#constructor]: ../base.litcoffee#constructor
[Parent]: ./index.litcoffee
