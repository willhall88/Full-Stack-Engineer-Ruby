import React from 'react';
import $ from 'jquery';
import ComicCard from './comic_card.es6.js';

class ComicsSection extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: props
    };
  }

  render() {
    const cardsNode = this.state.data.comics.map(
      comic => <ComicCard key={comic.id} comic={comic} />
    )
    return(
      <div>
        <div className="c-comic__outer-wrapper">
          {cardsNode}
        </div>
      </div>
    )
  }

}
module.exports = ComicsSection;