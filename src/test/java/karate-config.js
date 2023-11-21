function fn() {
  var env = karate.env;

  var config = {
    env: env,
    urlBase: 'https://petstore.swagger.io/v2'
  }

  return config;
}

