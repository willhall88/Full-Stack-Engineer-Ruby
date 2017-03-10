import React from 'react';
import $ from 'jquery';
import ComicCard from './comic_card.es6.js';

class ComicsSection extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      comics: props.comics,
      offset: props.offset,
      characters: ''
    };

    this._handleClick = this._handleClick.bind(this);
    this._handleSubmit = this._handleSubmit.bind(this);
  }

  _handleClick(e) {
    e.preventDefault();
    var offsetVal = 15;
    if(e.target.classList.contains('c-page__prev')) {
      offsetVal = -15;
    }
    this._fetchPage(offsetVal);
  }

  _handleSubmit(e) {
    e.preventDefault();
    this._searchCharacter(e.target.elements[0].value);
  }

  _fetch(url) {
    return new Promise(
      (resolve, reject) => {
        fetch(`${url}`)
          .then((response) => response.json())
          .then((responseJson) => {
            this.setState({
              comics: responseJson.comics,
              offset: +responseJson.offset,
              characters: responseJson.characters
            });
            resolve();
          })
          .catch((error) => {
            reject(error);
          });
      }
    );
  }

  _fetchPage(val) {
    var newOffset = +this.state.offset + val;
    if (newOffset < 0) {
      return;
    };
    var url = `/comics/index?offset=${newOffset}&characters=${this.state.characters}`;
    return this._fetch(url);
  }

  _searchCharacter(searchTerm) {
    var url = `/comics/search?character=${searchTerm}`;
    return this._fetch(url);
  }

  render() {
    const cardsNode = this.state.comics.map(
      comic => <ComicCard key={comic.id} comic={comic} />
    )
    return(
      <div>
        <div className="c-search">
          <form className="c-search__form" onSubmit={this._handleSubmit}>
              <input className="c-search__input" type="text" placeholder="Character search.." value={this.state.value} />
          </form>
        </div>
        <div className="c-comic__outer-wrapper">
          {cardsNode}
        </div>
        <a className="c-page__prev js-pagination" href='#' onClick={this._handleClick}>Prev Page</a>
        <a className="c-page__next js-pagination" href='#' onClick={this._handleClick}>Next Page</a>
      </div>
    )
  }

}
module.exports = ComicsSection;