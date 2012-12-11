chai = require 'chai'
expect = chai.expect
chai.should()

{isTrigger, root, Logger, Request} = require '../build/trigger_helper.js'

describe 'In trigger enviornment', ->
  it 'should return false', ->
    isTrigger().should.be.false