process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

// Hot reload views via webpack dev server.
// https://github.com/rails/webpacker/issues/1879
// However, Circle CI system test choke on this. NODE_ENV is
// 'development' in tests by default. So check RAILS_ENV and
// skip hot reload in testing.
if (process.env.RAILS_ENV == "development") {
  const chokidar = require("chokidar");

  environment.config.devServer.before = (app, server) => {
    chokidar
      .watch([
        "config/locales/*.yml",
        "app/assets/stylesheets/**/*.scss",
        "app/views/**/*.md",
        "app/views/**/*.html.erb",
        "app/views/**/*.html.haml",
      ])
      .on("change", () => server.sockWrite(server.sockets, "content-changed"));
  };
}

module.exports = environment.toWebpackConfig()
