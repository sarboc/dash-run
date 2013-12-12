#= require spec_helper

beforeEach ->
  page("/new")

describe "view", ->

  it "should render the new thing view when a user goes to /new", ->
    expect($("#new-thing")).to.exist

  it "should not have the new contributor form when a user goes to /new", ->
    expect($("#new-contributor")).to.not.exist

  # it "is not marked as completed", ->
  #   $('[name=completed]').should.not.be.checked
  #   $('.todo-body').should.not.have.class("completed")