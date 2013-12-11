#= require spec_helper

beforeEach ->
    # @model = new App.Model

describe "page routing", ->

  it "should render the new thing view when a user goes to /new", ->
    $('.todo-body').should.have.text("Do something!")

  it "is not marked as completed", ->
    $('[name=completed]').should.not.be.checked
    $('.todo-body').should.not.have.class("completed")