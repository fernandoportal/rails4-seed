document.addEventListener('page:change', function() {
	document.getElementById('loading-page').className += 'animated fadeOut';
	document.getElementById('primary-content').className += 'animated fadeIn';
});

document.addEventListener('page:fetch', function() {
	document.getElementById('loading-page').className += 'animated fadeIn';
	document.getElementById('primary-content').className += 'animated fadeOut';
});