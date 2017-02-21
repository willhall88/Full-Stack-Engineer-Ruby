`/** @jsx React.DOM */`

@ComicCard = React.createClass
  displayName: 'ComicCard'
  render: ->
    React.createElement("div", {"className": "c-comic__wrapper"},
      React.createElement("div", {"className": "c-comic"},
        React.createElement("div", {"className": "c-comic__image-wrapper"},
          React.createElement("div", {"className": "c-comic__image-inner"},
            React.createElement("img", {"className": "c-comic__cover-image", "src": (@props.data.thumbnail), "alt": "MDN"})
          )
        ),
        React.createElement("div", {"className": "c-comic__title-wrapper"},
          React.createElement("div", {"className": "c-comic__title"},
            React.createElement("h4", null, (@props.data.title))
          )
        ),
        React.createElement("a", {"className": "c-comic__link u-faux-block-link__overlay"})
      )
    )