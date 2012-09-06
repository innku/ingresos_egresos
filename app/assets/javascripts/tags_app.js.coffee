class window.TagsApp
  constructor: (tags, @elem = $('#tags')) ->
    @tags_view = new TagsApp.TagsView(tags)
    @tag_form_view = new TagsApp.TagFormView(@elem)
    @elem.on "click", "#add_tag", @add_tag

    
  add_tag:(e) =>
    e.preventDefault()
    @tags_view.add_tag(@tag_form_view.add_tag_input.val())
    @tag_form_view.update()
  
  render: ->
    @elem.append @tags_view.render()
    @elem


class TagsApp.TagFormView
  constructor: (@elem) ->
    @add_tag_input = @elem.find('#new_tag')
    @add_tag_input.autocomplete({
      source: "/tags.json",
      minLength: 2
    })
    @hidden_tags_input = @elem.find('#register_tag_list')
    @elem.on "element-removed", @remove_tag

  update: () ->
    if @hidden_tags_input.val() is "" 
      current_items = []
    else 
      current_items = @hidden_tags_input.val().split(',')
    current_items.push(@add_tag_input.val())
    console.log current_items
    @hidden_tags_input.val(current_items.join(",")) 
    @add_tag_input.val('')

  remove_tag: (e,data) =>
    current_items = @hidden_tags_input.val().split(',')
    updated_items = current_items.filter (word) -> word isnt data.tag_name
    @hidden_tags_input.val(updated_items.join(",")) 


class TagsApp.TagsView
  constructor: (@tags) ->
    @elem = $('<ul id="tags-list">')

  render: ->
    @add_tag(tag) for tag in @tags
    @elem
  
  add_tag: (tag) ->
    tag_view = new TagsApp.TagView(tag)
    @elem.append tag_view.render()
    

class TagsApp.TagView
  constructor: (@tag) ->
    @elem = $(@template())
    @elem.on "click", ".delete", @remove_tag

  remove_tag: (e) =>
    e.preventDefault()
    @elem.trigger("element-removed", {tag_name: @tag})
    @elem.remove()

  template: () ->
    """
      <li>#{@tag}<a href='#' class="delete"><i class="icon-remove"></i></a></li>
    """

  render: ->
    @elem