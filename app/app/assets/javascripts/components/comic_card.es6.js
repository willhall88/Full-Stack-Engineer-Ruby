import React from 'react';
import cookie from 'react-cookie';
var classNames = require('classnames');

class ComicCard extends React.Component {
  constructor(props) {
    super(props);
    this.state =  { favorites: cookie.load('comic_ids') };
    this._handleClick = this._handleClick.bind(this);
  }

  _handleClick(e) {
    return new Promise(
      (resolve, reject) => {
        fetch(`/favorites/toggle?id=${this.props.comic.id}`, {method: 'POST', credentials: 'include'})
          .then((response) => response.json())
          .then((responseJson) => {
            cookie.save('comic_ids', responseJson.list);
            this.setState({
              favorites: responseJson.list
            })
            resolve();
          })
          .catch((error) => {
            reject(error);
          });
      }
    );
  }

  render() {
    var classes = classNames({
      'c-comic__wrapper': true,
      'c-comic--favorite': this.state.favorites.includes(this.props.comic.id.toString())
    });
    return(
      <div className={classes}>
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
          <a className= "c-comic__link u-faux-block-link__overlay" onClick={this._handleClick}></a>
        </div>
      </div>
    );
  }
}
module.exports = ComicCard;