# Test Base Class

    should = require 'should'
    module.exports = (Base, name = 'Base') ->
      describe name, ->
        it 'should be a class', -> Base.should.be.a.class

The Base [constructor][Base#constructor] should create a private
**#___runtime** object, which is used to keep temporary
data that might be needed during the instance lifetime

        describe '#constructor()', ->
          it 'should return an instance of Base', ->
            (new Base).should.be.an.instanceof Base

          it 'should create a private #___runtime object', ->
            Object.getOwnPropertyDescriptor (new Base), '___runtime'
              .should.have.properties
                enumerable:false, writable:false, configurable:false

[Base#constructor]: ../base.litcoffee#constructor
