import React from 'react';
import $ from 'jquery';
import ComicCard from './comic_card.es6.js';

class ComicsSection extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      comics: props.data.comics,
      offset: props.data.offset
    };

    this._handleClick = this._handleClick.bind(this);
  }

  _handleClick(e) {
    e.preventDefault();
    this._fetchPage();
  }

  _fetchPage() {
    return new Promise(
      (resolve, reject) => {
        var newOffset = +this.state.offset + 15;
        fetch(`/comics/index?offset=${newOffset}`)
          .then((response) => response.json())
          .then((responseJson) => {
            this.setState({
              comics: responseJson.comics,
              offset: +responseJson.offset
            });
            resolve();
          })
          .catch((error) => {
            reject(error);
          });
      }
    );
  }

  render() {
    const cardsNode = this.state.comics.map(
      comic => <ComicCard key={comic.id} comic={comic} />
    )
    return(
      <div>
        <div className="c-comic__outer-wrapper">
          {cardsNode}
        </div>
        <a className="c-page__next js-pagination" href='#' onClick={this._handleClick}>Next Page</a>
      </div>
    )
  }

}
module.exports = ComicsSection;