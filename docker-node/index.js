const express = require('express');

const App = express();

App.get('/', function (req, res) {
    res.send(`
        <h1 style="text-align: center">
            Docker Node App is Running Successfully.
        </h1>
    `)
});

App.listen(8090, function () {
    console.log('Docker Node App is Listening on Port 8090');
    console.log('Open http://localhost:8090/ in Your Browser.');
});
