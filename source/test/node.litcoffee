# Test Node Class

    should = require 'should'
    module.exports = (Node, name = 'Node') ->
      describe name, ->
        it 'should be a class', -> Node.should.be.a.class
        describe '#constructor()', ->
          it 'should return an instance of Node', ->
            (new Node).should.be.an.instanceof Node
            
[Node#constructor]: ../base.litcoffee#constructor
