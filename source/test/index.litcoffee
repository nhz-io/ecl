# ecl tests

    test = require './base'
    test (require '../base'), 'Base'
    test (require '../event'), 'Event'
    test (require '../node'), 'Node'
    test (require '../evented'), 'Evented'

    test = require './event'
    test (require '../event'), 'Event'

    test = require './node'
    test (require '../node'), 'Node'
    test (require '../evented'), 'Evented'

    test = require './evented'
    test (require '../evented'), 'Evented'
