# Test Base Class
* Parent: [Test][Parent]

    should = require 'should'
    module.exports = (Base, name = 'Base') ->
      describe name, ->
        it 'should be a class', -> Base.should.be.a.class

        describe '#constructor(args)', ->
          it 'should return an instance of Base', ->
            (new Base).should.be.an.instanceof Base

The Base [constructor][Base#constructor] should create a private
**#___runtime** object, which is used to keep temporary
data that might be needed during the instance lifetime
          
          it 'should create a private #___runtime object', ->
            Object.getOwnPropertyDescriptor (new Base), '___runtime'
              .should.have.properties
                enumerable:false, writable:false, configurable:false

The constructor should also copy everything from the **args** into the instance.
          
          it 'should copy everything from args to the instance', ->
            (new Base a:1, b:2, c:3).should.have.properties a:1, b:2, c:3

[Base#constructor]: ../base.litcoffee#constructor
[Parent]: ./index.litcoffee
