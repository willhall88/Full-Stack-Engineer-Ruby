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

describe('ComicSection component', function() {
  it('includes multiple ComicCard components', function() {
    const data = {
      comics:[{id: 1, title: 'title', thumb: 'thumb'}, {id: 2, title: 'title', thumb: 'thumb'}],
      offset:0
    };
    const comicSection = renderIntoDocument(<ComicSection comics={data.comics} offset={data.offset} />);
    const instances = scryRenderedComponentsWithType(comicSection, ComicCard).length;
    expect(instances).to.be.at.least(2);
  });
});

describe('Pagination', function() {
  it('changes to next page', function(done) {
    fetchMock
      .mock('/comics/index?offset=15', 'GET', {
        comics:[{id: 2, title: 'title2', thumb: 'thumb'}],
        offset:15
      });
    const data = {comics:[{id: 1, title: 'title', thumb: 'thumb'}], offset:0};
    const comicSection = renderIntoDocument(<ComicSection comics={data.comics} offset={data.offset} />);
    comicSection._fetchPage(15)
      .then(function() {
        expect(comicSection.state.offset).to.eq(15);
        expect(fetchMock.called('/comics/index?offset=15')).to.be.true;
        done();
      })
      .catch(function(err) {
        done(err);
      })
  });

  it('changes to prev page', function(done) {
    fetchMock
      .mock('/comics/index?offset=0', 'GET', {
        comics:[{id: 1, title: 'title', thumb: 'thumb'}],
        offset:0
      });
    const data = {comics:[{id: 2, title: 'title2', thumb: 'thumb'}], offset:15};
    const comicSection = renderIntoDocument(<ComicSection comics={data.comics} offset={data.offset} />);
    comicSection._fetchPage(-15)
      .then(function() {
        expect(comicSection.state.offset).to.eq(0);
        expect(fetchMock.called('/comics/index?offset=0')).to.be.true;
        done();
      })
      .catch(function(err) {
        done(err);
      })
  });

  it('will not allow previous pages past first page', function(done) {
    const data = {comics:[{id: 2, title: 'title2', thumb: 'thumb'}], offset:0};
    const comicSection = renderIntoDocument(<ComicSection comics={data.comics} offset={data.offset} />);
    comicSection._fetchPage(-15)
      .then(function() {
        expect(comicSection.state.offset).to.eq(0);
        done();
      })
      .catch(function(err) {
        done(err);
      })
  });
});