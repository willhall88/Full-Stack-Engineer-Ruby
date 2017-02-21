`/** @jsx React.DOM */`

@ComicsSection = React.createClass
  displayName: 'ComicsSection'

  getInitialState: ->
    didFetchData: false
    comics: []

  componentDidMount: ->
    @_fetchComics({})

  _fetchComics: (data) ->
    $.ajax
      url: 'http://localhost:3000/comics/index'
      dataType: 'json'
      data: data
    .done @_fetchDataDone
    .fail @_fetchDataFail

  _fetchDataDone: (data, textStatus, jqXHR) ->
    @setState
      didFetchData: true
      comics: data

  _fetchDataFail: (xhr, status, err) =>
    console.error @props.url status, err.toString()

  render: ->
    cardsNode = @state.comics.map (comic) ->
      React.createElement(ComicCard, {"key": (comic.id), "data": (comic)})

    # HTML displayed if no comics found in it's state
    noDataNode =
      React.createElement("div", {"className": "warning"},
        React.createElement("span", {"className": "fa-stack"},
          React.createElement("i", {"className": "fa fa-meh-o fa-stack-2x"})
        ),
        React.createElement("h4", null, "No comics found...")
      )

    React.createElement("div", null,
      React.createElement("div", {"className": "c-comic__outer-wrapper"},
        (
          if @state.comics.length > 0
            cardsNode
          else if @state.didFetchData
            noDataNode
        )
      )
    )