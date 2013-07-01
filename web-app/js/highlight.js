function highlightTab(tabId) {
	$(tabId).addClass("active");
}

function highlightMenuItem() {
	var pathname = window.location.pathname;
	var page = pathname.substring(pathname.lastIndexOf("/") + 1);



	$("#leftNav .leftMenu li a").each(function() {
		var url = $(this).attr("href");

		var questionMarkIndex = url.indexOf("?");
		//if the URL has parameters, don't consider the parameters for highlighting

		if (questionMarkIndex != -1) {
			url = url.substring(0, questionMarkIndex);

		var result = url.substring(url.lastIndexOf("/") + 1);

		if (result==page) {
			$(this).addClass("active");
		} else {
			$(this).removeClass("active");
		}

		}
	});
}
