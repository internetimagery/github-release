# Simple Ajax request
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

@scan_releases = ( class_name = "releases" )->
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
            # Collect data from API.
            # Replace anchor element with a list element
            # Populate the list element with new anchors for each release
            release_data = JSON.parse response
            assets = release_data.assets
            if assets and assets.length
              new_link_list = document.createElement "ul"
              new_link_list.className = class_name
              link.parentNode.replaceChild new_link_list, link
              for asset in assets
                new_entry = document.createElement "li"
                new_link_list.appendChild new_entry
                new_link = document.createElement "a"
                new_link.href = asset.browser_download_url
                new_link.innerHTML = asset.name
                new_entry.appendChild new_link
          catch err
            console.error err.message
