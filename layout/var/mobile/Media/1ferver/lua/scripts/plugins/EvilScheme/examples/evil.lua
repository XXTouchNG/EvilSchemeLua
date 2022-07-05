local EvilScheme = require("plugins.EvilScheme")
EvilScheme.setup("safari")

-- supported schemes:
--   "safari"
--   "chrome"
--   "firefox"
--   "opera"
--   "edge"

app.quit('*')
app.open_url("https://bing.com")
