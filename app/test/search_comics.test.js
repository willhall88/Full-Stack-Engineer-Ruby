import * as React from 'react';
import { expect } from 'chai';
import {
  renderIntoDocument,
  findRenderedDOMComponentWithClass,
  scryRenderedComponentsWithType
} from 'react-addons-test-utils';

var fetchMock = require('fetch-mock');
fetchMock.greed = 'bad';

import ComicCard from '../app/assets/javascripts/components/comic_card.es6.js';
import ComicSection from '../app/assets/javascripts/components/comic_section.es6.js';

describe('Searching', function() {
  it('can search for a hero', function(done) {
    const comic = [{id: 2, title: 'hulk smash', thumb: 'hulk_thumb'}]
    fetchMock
      .mock('/comics/search?character=hulk', 'GET', {
        comics: comic,
        offset: 0,
        characters: [2]
      });
    const data = {comics:[{id: 1, title: 'title', thumb: 'thumb'}], offset:0};
    const comicSection = renderIntoDocument(<ComicSection comics={data.comics} offset={data.offset} />);
    comicSection._searchCharacter('hulk')
      .then(function() {
        expect(fetchMock.called('/comics/search?character=hulk')).to.be.true;
        expect(comicSection.state.comics).to.eql(comic);
        expect(comicSection.state.characters).to.eql([2])
        done();
      })
      .catch(function(err) {
        done(err);
      })
  });
});
