(function(){var e;e=function(e,t){var r;return r=new XMLHttpRequest,r.onreadystatechange=function(){if(r.readyState===XMLHttpRequest.DONE)return 200===r.status?t(null,r.responseText):t(400===r.status?new Error("STATUS 400: Failed to load "+e):new Error("STATUS "+r.status+": Failed to load "+e))},r.open("GET",e,!0),r.send()},this.scan_releases=function(t){var r,n,a,s,l,o;for(null==t&&(t="releases"),r=document.getElementsByTagName("a"),n=/http[s]?:\/\/github\.com\/(\w+)\/(\w+)\/releases\/latest/,o=[],a=0,s=r.length;a<s;a++)l=r[a],o.push(function(r){var a,s;if(s=n.exec(r.href))return a="https://api.github.com/repos/"+s[1]+"/"+s[2]+"/releases/latest",e(a,function(e,n){var a,s,l,o,u,c,i,d,h;if(e)return console.error(e.message);try{if(d=JSON.parse(n),s=d.assets,s&&s.length){for(i=document.createElement("ul"),i.className=t,r.parentNode.replaceChild(i,r),h=[],l=0,o=s.length;l<o;l++)a=s[l],u=document.createElement("li"),i.appendChild(u),c=document.createElement("a"),c.href=a.browser_download_url,c.innerHTML=a.name,h.push(u.appendChild(c));return h}}catch(t){return e=t,console.error(e.message)}})}(l));return o}}).call(this);