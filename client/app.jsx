import 'mtg-card-seer';
import React from 'react';
import Home from './pages/home';
import Popular from './pages/popular';
import Formats from './pages/formats';
import NotFound from './pages/not-found';
// mtg card seer multiple packages that include the deck/card image view with scryfall.

function parseRoute(hashRoute) {
  if (hashRoute.startsWith('#')) {
    hashRoute = hashRoute.replace('#', '');
  }
  const [path, queryString] = hashRoute.split('?');
  const params = new URLSearchParams(queryString);
  return { path, params };
}

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      route: parseRoute(window.location.hash)
    };
  }

  componentDidMount() {
    /**
     * Listen for hash change events on the window object
     * Each time the window.location.hash changes, parse
     * it with the parseRoute() function and update state
     */
    const mountedThis = this;
    window.addEventListener('hashchange', function (event) {
      const newRoute = parseRoute(window.location.hash);
      mountedThis.setState({ route: newRoute });
    });
  }

  renderPage() {
    const { route } = this.state;
    if (route.path === '') {
      return <Home />;
    }
    if (route.path === 'popular') {
      return <Popular />;
    }
    if (route.path === 'formats') {
      return <Formats />;
    }
    return <NotFound />;
  }

  render() {
    return (
      <>
        {this.renderPage()}
      </>
    );
  }
}
