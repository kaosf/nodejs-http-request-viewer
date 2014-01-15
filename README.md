# HTTP Request Viewer

This is a HTTP Request Viewer with Socket.IO.

## Requirement

* Node.js

## Usage

Clone this repository

```sh
git clone https://github.com/kaosf/nodejs-http-request-viewer
```

or download a ZIP file.

Execute following commands;

```sh
npm install
# app.coffee will be compiled to app.js automatically
node app.js
```

Access to `http://localhost:8080` with your web browser.

Open another tab or launch another web browser,
and then access to a URL like `http://localhost:8080/a/b/c?x=1&y=2`.

The first web browser's window will show you the HTTP request detail.

## References

* http://socket.io/#how-to-use
* http://blog.choilabo.com/20120320/31
* http://stackoverflow.com/questions/7140844/jquery-animations-when-appending-html
* http://stackoverflow.com/questions/3073869/in-jquery-is-prepend-hide-fadein-not-so-smooth

## Deployment on Heroku

Modify the URL in `index.html`.

```diff
 <script>
-  var socket = io.connect('http://localhost:8080');
+  var socket = io.connect('http://yourappname.herokuapp.com');
   socket.on('prepend-log', function (data) {
```

Add configurations for Socket.IO on Heroku.

```diff
 io.configure ->
   io.set 'log level', 1
+  io.set 'transports', ['xhr-polling']
+  io.set 'polling duration', 10
 
 app.listen (process.env.PORT || 8080)
```

### References

* http://qiita.com/takc923/items/2d1ad6bc8a6e4b910d14
* https://devcenter.heroku.com/articles/node-websockets
* http://blog.craftgear.net/4f99e27daa1d381e04000001/title

## License

[MIT](http://opensource.org/licenses/MIT)

Copyright 2014 ka
