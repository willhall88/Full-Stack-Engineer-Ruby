import * as React from 'react';
import { expect } from 'chai';
import {
  renderIntoDocument,
  findRenderedDOMComponentWithClass,
  scryRenderedComponentsWithType
} from 'react-addons-test-utils';
import $ from 'jquery';
import ComicCard from '../app/assets/javascripts/components/comic_card.es6.js';

describe('ComicCard', function() {
  it('renders', function() {
    const comic = {'id': '1', 'title': 'hello', 'thumbnail': 'some.url'};
    const card = renderIntoDocument(
      <ComicCard comic={comic} />
    );
    expect(card).to.exist;
  });

  it('has a title', function() {
    const comic = {'id': '1', 'title': 'Title', 'thumbnail': 'some.url'};
    const card = renderIntoDocument(
      <ComicCard comic={comic} />
    );
    const title = findRenderedDOMComponentWithClass(card, 'c-comic__title');
    const titleText = title.textContent;
    expect(titleText).to.equal('Title');
  });

  it('has a thumbnail', function() {
    const comic = {'id': '1', 'title': 'Title', 'thumbnail': 'some.url'};
    const card = renderIntoDocument(
      <ComicCard comic={comic} />
    );
    const thumb = findRenderedDOMComponentWithClass(card, 'c-comic__cover-image');
    const thumbSrc = thumb.src;
    expect(thumbSrc).to.equal('some.url');
  });
});
