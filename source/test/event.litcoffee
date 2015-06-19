# Test Event Class
* Parent: [Test][Parent]

    should = require 'should'
    module.exports = (Event, name = 'Event') ->
      describe name, ->
        it 'should be a class', -> Event.should.be.a.class

        describe '#constructor()', ->
          it 'should return an instance of Event', ->
            (new Event).should.be.an.instanceof Event

The Event [constructor][Event#constructor] should set the **#type**
property, creation **#timestamp** and the **#callback**

          it 'should set the event type', ->
            (new Event 'test').type.should.be.equal 'test'

          it 'should set the timestamp', ->
            (new Event timestamp:true).timestamp.should.be.a.Number

          it 'should set the callback', ->
            (new Event 'test', (cb = ->)).callback.should.be.equal cb

The [#cancel()][Event#cancel] method should set #___runtime.cancel to `true`
        
        describe '#cancel()', ->
          it 'should return the event', ->
            (e = new Event).cancel().should.be.equal e

          it 'should set the cancel flag', ->
            (new Event).cancel().___runtime.cancel.should.be.equal true

The [#stop()][Event#stop] method should set #___runtime.stop to `true`
        
        describe '#stop()', ->
          it 'should return the event', ->
            (e = new Event).stop().should.be.equal e

          it 'should set the stop flag', ->
            (new Event).stop().___runtime.stop.should.be.equal true

The [#abort()][Event#abort] method should set #aborted to `true`
        
        describe '#abort()', ->
          it 'should return the event', ->
            (e = new Event).abort().should.be.equal e

          it 'should set the abort flag', ->
            (new Event).abort().aborted.should.be.equal true

[Event#cancel]: ../event.litcoffee#cancel
[Event#stop]: ../event.litcoffee#stop
[Event#abort]: ../event.litcoffee#abort
[Event#constructor]: ../base.litcoffee#constructor
[Parent]: ./index.litcoffee
