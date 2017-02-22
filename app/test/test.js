import * as React from 'react';
import { expect } from 'chai';
import {
  renderIntoDocument,
  findRenderedDOMComponentWithClass,
  scryRenderedComponentsWithType
} from 'react-addons-test-utils';

import {ComicCard} from '../app/assets/javascripts/components/comic_card.js.jsx';

describe('ComicCard', function() {
  it('should render', function() {
    const comic = {'title': 'hello', 'thumbnail': 'thumb'};
    const item = renderIntoDocument(
      <ComicCard comic={comic} />
    );

    expect(item).to.exist;
  });
});
