# Test Event Class

    should = require 'should'
    module.exports = (Event, name = 'Event') ->
      describe name, ->
        it 'should be a class', -> Event.should.be.a.class
        describe '#constructor()', ->
          it 'should return an instance of Event', ->
            (new Event).should.be.an.instanceof Event
            
[Event#constructor]: ../base.litcoffee#constructor
