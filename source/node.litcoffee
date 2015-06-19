# CLASS: Node
* Extends: [Base][Base]
* Parent: [Index][Parent]

Hierarchical tree structure.

    module.exports = class Node extends require './base'

Instances of [Node][Node] can act as both **parent** and **child**.
Parents cannot have duplicate children, each child can have one parent.
There are no cyclic checks, so its not idiot proof. Avoid!

---

## CONSTRUCTOR

### new Node(args)

Creates [Node][Node] instance.

      constructor: -> super

### PARAMETERS
**args**
* Type: [Object][Object] - named arguments

---

## PROPERTIES

**#parent**
* Type: [Node][Node] - Node parent. Created only if passed in args.

**#children**
* Type: [Array][Array] - List of children. Created only if passed in args

---

## METHODS

### #appendChild(child)
* Returns: [Node][Node]

Appends the **child** to the **#children**.

      appendChild: (child) ->

If the **child** is not this instance

        if child isnt this

initialize the **#children** if necessary.

          @children ||= []

If **child** isnt already int the children list,

          if -1 is @children.indexOf child

remove the **child** from it's parent if it has one

            child.parent?.removeChild? child

and update the child's parent.

            child.parent = this

Finally, append the **child** to the **#children** list.

            @children.push child

        return this

#### PARAMETERS

**child**
* Type: [Node][Node] - The child to append.

### #removeChild(child)

---

Removes the **child** from the **#children**.

      removeChild: (child) ->

If there are any children and the **child** belongs to this parent

        if @children?.length and -1 isnt idx = @children.indexOf child
          
make the **child** forget about it's parent

          delete child.parent

and remove the **child** from **#children**.

          @children.splice idx, 1

Delete the **#children** if it is empty.

          delete @children if @children.length is 0

        return this

#### PARAMETERS

**child**
* Type: [Node][Node] - The child to remove.

[Object]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object
[Array]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array
[Base]: ./base.litcoffee
[Node]: ./node.litcoffee
[Parent]: ./index.litcoffee
