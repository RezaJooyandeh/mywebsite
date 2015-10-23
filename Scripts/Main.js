var EmailObfuscator = (function () {
	function EmailObfuscator() {
	}
	EmailObfuscator.writeEmailTo = function (elementId) {
		var nos = $("#" + elementId);
		var parent = nos.parent();
		nos.remove();

		var data = new Array(
			609, 621, 613, 608, 632, 611, 566, 638,
			617, 630, 621, 588, 614, 611, 611, 629,
			621, 610, 616, 617, 612, 546, 623, 611,
			609, 524, 638, 617, 630, 621, 588,
			614, 611, 611, 629, 621, 610, 616, 617,
			612, 546, 623, 611, 609, 524);
		parent.append(getLink(data, ''));
	};

	function getLink(data, extratag) {
		var result;
		var idx = 0, n = data[data.length - 1];
		var fields = 0, i;
		for (i = 0; i < data.length; i++) { if (data[i] == n) { fields++; } }
		if (fields > 1) { result = '<a href="'; }
		while (data[idx] != n) { result += '&#' + (data[idx++] ^ n) + ';'; }
		idx++;
		if (fields > 2) {
			result += '" title="';
			while (data[idx] != n) { result += '&#' + (data[idx++] ^ n) + ';'; }
			idx++;
		}
		if (fields > 1) {
			result += '">';
			if (extratag != "") {
				result += '<' + extratag + '>';
			}

			while (data[idx] != n) { result += '&#' + (data[idx++] ^ n) + ';'; }
			idx++;
			if (extratag != "") {
				result += '<\/' + extratag + '>';
			}


			result += '<\/a>';

			return result;
		}
	}

	return EmailObfuscator;
})();

var PanelManager = (function () {
	function PanelManager() {
		this._names = [];
		this._latestPanelsInstance = [];
	}

	PanelManager.prototype.names = function (names) {
		this._names = names;
		this._latestPanelsInstance = names.map(function (name) { return $(".panel" + name + "Content"); });

		return this;
	}

	PanelManager.prototype.setContents = function () {
		var self = this;
		this._names.forEach(function (name, i) {
			var currentVisible = $(".panel" + name + ":visible");
			if (self._latestPanelsInstance[i][0] !== currentVisible[0]) {
				//if (self._latestPanelsInstance[i].html() === "") {
				//	self._latestPanelsInstance[i] = $('.device-' + alias + ":not(:empty)");
				//}
				self._latestPanelsInstance[i].children().appendTo(currentVisible);
				self._latestPanelsInstance[i] = currentVisible;
			}
		});
	}

	return PanelManager;
})();

var SearchEngine = (function () {
	function SearchEngine() {
	}

	SearchEngine.search = function () {
		var txtQuery = document.getElementById("query");
		window.location = "http://www.google.com/search?sitesearch=jooyandeh.com&q=" + txtQuery.value;
	};

	return SearchEngine;
})();

var Page = (function () {
	var _isLoaded = false;
	var _panelManager = null;

	function Page(settings) {
		if (settings && settings.panels) {
			_panelManager = new PanelManager()
				.names(settings.panels);
		}

		this.onReady = [setPanelManagersContent];
		this.onResize = [];
		this.onResizeReady = [setPanelManagersContent];

		var self = this;
		$(window).resize(function () {
			self.onResize.forEach(function (d) {
				d();
			});
			if (_isLoaded) {
				self.onResizeReady.forEach(function (d) {
					d();
				});
			}
		});

		$(document).ready(function () {
			_isLoaded = true;
			self.onReady.forEach(function (d) {
				d();
			});
		});
	}

	function setPanelManagersContent() {
		if (_panelManager)
			_panelManager.setContents();
	}

	Page.prototype.isInMode = function (mode) {
		return $('.device-' + mode).is(':visible');
	}

	return Page;
})();

var Braille = (function () {
	function Braille() {
	}

	function Symbol(name) {
		this.name = name;
	}

	Braille.Symbols = {
		Capital: new Symbol("Capital")
	};

	var activeRadius = 15;
	var inactiveRadius = 3;
	var allDots = [1, 2, 3, 4, 5, 6, 7, 8];
	var mapping = (function () {
		var mapping = {
			"a": [1],
			"d": [1, 4, 5],
			"e": [1, 5],
			"h": [1, 2, 5],
			"j": [2, 4, 5],
			"n": [1, 3, 4, 5],
			"o": [1, 3, 5],
			"r": [1, 2, 3, 5],
			"y": [1, 3, 4, 5, 6],
			"z": [1, 3, 5, 6],
			" ": []
		};

		mapping[Braille.Symbols.Capital] = [6];
		return mapping;
	})();

	Braille.writeToElement = function (symbolOrString, width, elementId) {
		var keys;
		if (typeof symbolOrString === "string") {
			keys = symbolOrString.toLowerCase().split('');
		}
		else {
			keys = [ symbolOrString ];
		}

		keys.forEach(function (d) {
			writeDots(d, mapping[d], width, elementId);
		});
	}

	function writeDots(symbolOrChar, dots, width, elementId) {
		var scale = width / 154;
		var height = 315 * scale;
		var svg = d3.select("#" + elementId).append("svg")
			.attr("width", width)
			.attr("height", height);

		svg.append("g")
			.attr("stroke", "black")
			.attr("fill", "black")
			.selectAll("circle")
			.data(dots)
			.enter()
				.append("circle")
					.attr("id", function (d) { return d; })
					.attr("cx", function (d) { return getCX(d) * scale; })
					.attr("cy", function (d) { return getCY(d) * scale; })
					.attr("r", activeRadius * scale);

		svg.append("g")
			.attr("stroke", "black")
			.attr("fill", "black")
			.selectAll("circle")
			.data(allDots.filter(function (x) { return dots.indexOf(x) === -1; }))
			.enter()
				.append("circle")
					.attr("id", function (d) { return d; })
					.attr("cx", function (d) { return getCX(d) * scale; })
					.attr("cy", function (d) { return getCY(d) * scale; })
					.attr("r", inactiveRadius * scale);

		svg.append("rect")
			.attr("width", width)
			.attr("height", height)
			.attr("fill", "transparent")
				.append("svh:title")
				.text((typeof symbolOrChar === "object") ? symbolOrChar.name : symbolOrChar);
	}

	function getCX(dotId) {
		switch (dotId) {
			case 1:
			case 2:
			case 3:
			case 7:
				return 66;
			case 4:
			case 5:
			case 6:
			case 8:
				return 128;
			default:
				throw "Out of range";
		}
	}

	function getCY(dotId) {
		switch (dotId) {
			case 1:
			case 4:
				return 46;
			case 2:
			case 5:
				return 108;
			case 3:
			case 6:
				return 169;
			case 7:
			case 8:
				return 229;
			default:
				throw "Out of range";
		}
	}


	return Braille;
})();