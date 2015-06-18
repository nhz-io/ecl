# Test Evented Class

    should = require 'should'
    module.exports = (Evented, name = 'Evented') ->
      describe name, ->
        it 'should be a class', -> Evented.should.be.a.class
        describe '#constructor()', ->
          it 'should return an instance of Evented', ->
            (new Evented).should.be.an.instanceof Evented
            
[Evented#constructor]: ../base.litcoffee#constructor
