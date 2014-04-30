module.exports = function(environment) {
  var ENV = {
    rootURL: '/',
    FEATURES: {
      'query-params-new': true
      // Here you can enable experimental featuers on an ember canary build
      // e.g. 'with-controller': true
    }
  };

  if (environment === 'development') {
    ENV.backendURL = 'http://louder.dev:8888';
  }

  if (environment === 'production') {

  }

  return JSON.stringify(ENV); // Set in index.html
};
