
request = (url, callback)->
  handle = new XMLHttpRequest()
  handle.onreadystatechange = ()->
    if handle.readyState == XMLHttpRequest.DONE
      if handle.status == 200
        callback null, handle.responseText
      else if handle.status == 400
        callback new Error "STATUS 400: Failed to load #{url}"
      else
        callback new Error "STATUS #{handle.status}: Failed to load #{url}"
  handle.open "GET", url, true
  handle.send()

@ready = ()->
  # Find all relevant links on the page
  # Check urls for any latest release github links
  # EXAMPLE:
  # https://github.com/{USERNAME}/{REPONAME}/releases/latest
  anchors = document.getElementsByTagName "a"
  base_url = /http[s]?:\/\/github\.com\/(\w+)\/(\w+)\/releases\/latest/

  # Run through each link, checking for valididty and reassembling the api version
  # EXAMPLE:
  # https://api.github.com/repos/{USERNAME}/{REPONAME}/releases/latest"
  for link in anchors
    do (link)->
      data = base_url.exec link.href
      if data
        api_url = "https://api.github.com/repos/#{data[1]}/#{data[2]}/releases/latest"
        request api_url, (err, response)->
          return console.error err.message if err
          try
            release_data = JSON.parse response
            for asset in release_data.assets or []
              download = asset.browser_download_url
              name = asset.name
              console.log link
          catch err
            console.error err.message
