var React = require('react');

const ComicCard = React.createClass({
  render: function() {
    return (
      <div className="c-comic__wrapper">
        <div className="c-comic">
          <div className="c-comic__image-wrapper">
            <div className="c-comic__image-inner">
              <img className="c-comic__cover-image" src= {this.props.comic.thumbnail} alt= "MDN" />
            </div>
          </div>
          <div className= "c-comic__title-wrapper">
            <div className= "c-comic__title">
              <h4>{this.props.comic.title}</h4>
            </div>
          </div>
          <a className= "c-comic__link u-faux-block-link__overlay"></a>
        </div>
      </div>
    );
  }
});

export {ComicCard};