document.addEventListener("turbolinks:load", function(){
	$input = $("[data-behavior='autocomplete']")

	var options = {
		getValue: 'name',
		url: function(phase) {
			return '/search.json?q='+ phase;
		},
		categories: [
			{
				listLocation: "users"
			}
		],
		list: {
			onChooseEvent: function(){
				var url = $input.getSelectedItemData().url
				$input.val("")
				Turbolinks.visit(url)
			}
		}
	}
	$input.easyAutocomplete(options)
});