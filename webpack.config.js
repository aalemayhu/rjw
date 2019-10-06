module.exports = {
  "output": {
    path: __dirname + '/dist', filename: "[name].pack.js"
  },
  "resolve": {
    "extensions": [
      ".imba",
      ".js",
      ".json"
    ]
  },
  "module": {
    "rules": [
      {
        "use": "imba/loader",
        "test": /\.imba$/
      }
    ]
  },
  "entry": {
    "index": "./src/index"
  }
};
