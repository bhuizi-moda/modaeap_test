window.grunticon=function(e){if(e&&3===e.length){var t=window,n=!!t.document.createElementNS&&!!t.document.createElementNS("http://www.w3.org/2000/svg","svg").createSVGRect&&!!document.implementation.hasFeature("http://www.w3.org/TR/SVG11/feature#Image","1.1"),s=function(s){var c=t.document.createElement("link"),o=t.document.getElementsByTagName("script")[0];c.rel="stylesheet",c.href=e[s&&n?0:s?1:2],o.parentNode.insertBefore(c,o)},c=new t.Image;c.onerror=function(){s(!1)},c.onload=function(){s(1===c.width&&1===c.height)},c.src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw=="}},grunticon(["stylesheets/custom/icons.data.svg.css","stylesheets/custom/icons.data.png.css","stylesheets/custom/icons.fallback.css"]);