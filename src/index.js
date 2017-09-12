import riot from 'riot'

let tags = require.context('./components', true, /\.tag$/)
tags.keys().forEach(tags)

riot.mount('*');