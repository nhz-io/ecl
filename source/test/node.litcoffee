# Test Node Class

    should = require 'should'
    module.exports = (Node, name = 'Node') ->
      describe name, ->
        it 'should be a class', -> Node.should.be.a.class

        describe '#constructor()', ->
          it 'should return an instance of Node', ->
            (new Node).should.be.an.instanceof Node

The Node [constructor][Node#constructor] should set the **#children** an
**#parent** properties.
      
          it 'should set the #children property', ->
            (new Node children: c = []).children.should.be.equal c

          it 'should set the #parent property', ->
            (new Node parent: p = {}).parent.should.be.equal p

        describe '#appendChild(child)', ->

The [#appendChild(child)][Node#appendChild] method should add the child to the
children list and should not add duplicates.
          
          it 'should add the child to #children', ->
            (new Node)
              .appendChild c = {}
              .appendChild c
              .children.length.should.be.equal 1

It also should remove the child from it's previous parent
          
          it 'should remove the child from the previous parent', ->
            (p1 = new Node)
              .appendChild c = {}
              .appendChild 'dummy'
              .children.length.should.be.equal 2

            (p2 = new Node).appendChild(c).children.length.should.be.equal 1
            p1.children.length.should.be.equal 1

        describe '#removeChild(child)', ->

The [#removeChild(child)][Node#removeChild] method should remove the child from
the children list. If there are no children left the #children should be deleted.

          it 'should remove the child from #children', ->
            (new Node)
              .appendChild c = {}
              .appendChild {}
              .removeChild c
              .children.length.should.be.equal 1

          it 'should delete the empty #children', ->
            should((new Node).appendChild(c = {}).removeChild(c).children).not.be.ok

[Node#constructor]: ../node.litcoffee#constructor
[Node#appendChild]: ../node.litcoffee#appendchildchild
[Node#removeChild]: ../node.litcoffee#removechildchild
