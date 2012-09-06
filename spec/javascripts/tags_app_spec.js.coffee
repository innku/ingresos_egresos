#= require 'application'

describe "TagsApp", ->
  beforeEach ->
    tag_one = 'one'
    tag_two = 'two'
    tags = [tag_one, tag_two]
    template = """
      <div>
        <input type="text" id="new_tag"/>
        <a href="#" id="add_tag"></a>
        <input type="hidden" id="register_tag_list" value="one,two">
      </div>
    """
    @elem = $(template)
    @app = new TagsApp(tags, @elem)

  describe "at initialization", ->
    it 'has one tags view',  ->
      expect(@app.tags_view.constructor).toEqual TagsApp.TagsView

  describe 'render', ->
    it 'displays en empty div if no tags are passed', ->
      empty_app = new TagsApp([], @elem)
      expect(empty_app.render().find('li').length).toEqual 0
 
    it 'displays an li for each tag passed', ->
      expect(@app.render().find('li').length).toEqual 2

  describe 'when a user clicks on the new tag button', ->
    beforeEach ->
      @html = @app.render()
      @html.find('#new_tag').val('eddie')
      @html.find('#add_tag').click()

    it 'adds a tag with the text in the text field', ->
      expect(@html.find('li').length).toEqual 3

    it 'updates the value of the hidden field', ->
      expect(@html.find('#register_tag_list').val()).toEqual 'one,two,eddie'

    it 'deletes the text inside the text field', ->
      expect(@html.find('#new_tag').val()).toEqual ''

  describe 'when a user clicks on delete link', ->
    beforeEach ->
      @html = @app.render()
      @html.find('li:first-child .delete').click()

    it 'removes the tag from the unordered list', ->
      expect(@html.find('li').length).toEqual 1

    it 'updates the value of the hidden field', ->
      expect(@html.find('#register_tag_list').val()).toEqual 'two'
