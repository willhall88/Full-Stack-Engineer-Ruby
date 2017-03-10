### Getting Started

- Clone this repo
- Run `bundle install`
- Run `npm install`
- Create a `.env` file with your own personal Marvel API keys

### Running tests
#### Rspec
- `bundle exec rspec`

#### Mocha
- `npm test`

### Running locally
- `bundle exec rails server`
- visit http://localhost:3000

### Comments, and retrospective
One of the biggest challenges I found when doing this project was getting Rails working smoothly with React as this was my first attempt at doing so.
Because of this I found that Cucumber, the tool I normally would use to feature test rails apps was very hard to set up to work with the React setup.
I switched to using Mocha to handle tests on the front end and all of the React modules. Then used Rspec to unit test the backend set up. Because of this
the project still felt a little disjointed as there wasn't the overarching tests. For my next project I will probably rethink how best to build this to
ensure testing across the whole codebase.
The next steps for this project would be to add a User model and choose an authentication solution. I chose to use cookies to store the favorites as
this seemed the best first step; it covers the whole use case for if a user is not logged in / registered. When the user model is created it will then
be a case of syncing up the cookie with the back end DB. Because the majority of the data is coming from the Marvel API there is no need to store that
information in a database and so a User model would be the rest real need to have a DB for the app.
Other thoughts on improving the app as it is (without building new features), would be to pre-load and cache multiple pages to speed up performance.

### Challenge spec:

- Description:
    - Using the best API available on this side of the universe, https://developer.marvel.com/ , make a simple app that allows the user to scroll trough all the comics ever released from the most recent to the oldest (and please, let me see the cover picture while I do it!);
    - Make it easy to search amongs the comics;
    - Let me upvote my favorite comics.

- Functional requirements (Using the Job to be Done framework):
    - When I open the page I want to see a list of all Marvel’s released comic books covers ordered from most recent to the oldest so I can scroll trough the the Marvel universe;
    - When I see the list of comics I want to be able to search by character (ex. deadpool) so that I can find my favorite comics;
    - When I see the list of comics I want to be able to upvote any of them so that the most popular are easy to find in the future.

- Technical requirements
    - Developed using mainly Ruby and Javascript.
    - Implement the design that is present inside the assets folder (HTML + CSS)

- Evaluation Criteria
    - you create maintainable code;
    - you care about the user experience ;
    - you pay attention to details;
    - you develop in a scalable manner.

