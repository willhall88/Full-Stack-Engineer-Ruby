import * as React from 'react';
import { expect } from 'chai';
import {
  renderIntoDocument,
  findRenderedDOMComponentWithClass,
  scryRenderedComponentsWithType
} from 'react-addons-test-utils';
var fetchMock = require('fetch-mock');

import ComicCard from '../app/assets/javascripts/components/comic_card.es6.js';

describe('Favoriting', function() {
  it('adding a comic to favorites', function(done) {
    fetchMock
      .mock('/favorites/toggle?id=1234', 'POST');
    const comic = {id:'1234', title: 'Hulk', 'thumbnail': 'some.url'};
    const card = renderIntoDocument(
      <ComicCard comic={comic} />
    );
    const link = findRenderedDOMComponentWithClass(card, 'c-comic__link');
    card._handleClick()
      .then(function() {
        expect(card.state.isFavorite).to.be.true;
        expect(fetchMock.called('/favorites/toggle?id=1234')).to.be.true;
        done()
      })
      .catch(function(err) {
        done(err);
      })
  });
});