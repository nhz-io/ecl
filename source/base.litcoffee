# CLASS: Base

Base superclass.

    module.exports = class Base

## CONSTRUCTOR

**new Base()**

Creates [Base][Base] instance. Initializes **#___runtime* object.

      constructor: (args) ->

and copies contents of the **args** into the instance.

        this[key] = value for own key, value of args

Creates a private property **#___runtime** and uses either args.___runtime or an empty
object as it's initial value.

        Object.defineProperty this, '___runtime',
          enumerable:no, writable:no, configurable:no, value:args?.___runtime or {}

## PROPERTIES

### #___runtime
* Type: [Object][Object]

Private property which serves as a heap of data that should not
be exposed on the instance. Created with enumerable, configurable
and writable set to **false**.

[Base]: ./base.litcoffee
[Object]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object
[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
