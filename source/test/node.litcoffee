# Test Node Class

    should = require 'should' 
    module.exports = (Node, name = 'Node') ->
      describe name, ->
        it 'should be a class', -> Node.should.be.a.class

        describe '#constructor()', ->
          it 'should return an instance of Node', ->
            (new Node).should.be.an.instanceof Node

**[toString()][Node#toString]** method should return `'[object Node]'`

        describe '#toString()', -> it 'should return [object Node]', ->
          (new Node).toString().should.be.equal '[object Node]'          

[Node#constructor]: ./base.litcoffee#constructor
[Node#toString]: ./base.litcoffee#toString
