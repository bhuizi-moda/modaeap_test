
// top-level namespace being assigned an object literal //ref Addy Osmani's Essential JS Namespacing
var modaEap = modaEap || {};

// a convenience function for parsing string namespaces and
// automatically generating nested namespaces
function extend( ns, ns_string ) {
    var parts = ns_string.split('.'),
        parent = ns,
        pl, i;
    if (parts[0] == "modaEap") {
        parts = parts.slice(1);
    }
    pl = parts.length;
    for (i = 0; i < pl; i++) {
        //create a property if it doesnt exist
        if (typeof parent[parts[i]] == 'undefined') {
            parent[parts[i]] = {};
        }
        parent = parent[parts[i]];
    }
    return parent;
}

// sample usage:
// extend myApp with a deeply nested namespace
// var mod = extend(modaEap, 'modaEap.modules.module2');

extend(modaEap, 'modaEap.domReady');

modaEap.domReady = $(function(){
	console.log('domReady');
	document.addEventListener("touchstart", function(){}, true); //accompanies _base.scss fix issue with tap element highlighting on android/webkit
	$('body').on('click', '.icon-menu-toggle', function(e){
		if($(this).hasClass('active')) {
			$('body').addClass('active-menu');
		} else {
			$('body').removeClass('active-menu');
		}
	});
	/*$('.icon-menu-toggle').off().on('vmousedown', function(event){
		var evt = event || window.event;
		console.log(evt);
		evt.preventDefault();
		evt.stopImmediatePropagation();
	});*/
});



