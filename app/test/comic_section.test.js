import * as React from 'react';
import { expect } from 'chai';
import {
  renderIntoDocument,
  findRenderedDOMComponentWithClass,
  scryRenderedComponentsWithType
} from 'react-addons-test-utils';

import ComicCard from '../app/assets/javascripts/components/comic_card.es6.js';
import ComicSection from '../app/assets/javascripts/components/comic_section.es6.js';

describe('ComicSection component', function() {
  it('should include multiple ComicCard components', function() {
    var data = [{id: 1, title: 'title', thumb: 'thumb'}, {id: 2, title: 'title', thumb: 'thumb'}];
    const comicSection = renderIntoDocument(
      <ComicSection comics={data} />
    );
    const instances = scryRenderedComponentsWithType(
      comicSection,
      ComicCard
    ).length;
    expect(instances).to.be.at.least(2);
  });
});