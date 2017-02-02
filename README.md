# Githug Release Links

Changes all "a" element links that link to a "latest" release page on github, into an unordered list of direct links to the release files.

To use, simply add the script to your page, and run the command:

```javascript
scan_releases(CLASSNAME);
```

This will turn the following:

```html
<a href="https://github.com/internetimagery/github-release/releases/latest"></a>
```

Into:

```html
<ul class="CLASSNAME">
  <li>
    <a href="https://github.com/internetimagery/github-release/releases/latest"></a>
  </li>
</ul>
```
