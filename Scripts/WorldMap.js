var continentsInfo = [
	{ name: "Asia", color: "#bbdd78" },
	{ name: "Africa", color: "lightgrey" },
	{ name: "Europe", color: "#aee8c7" },
	{ name: "North America", color: "#1fb477" },
	{ name: "South America", color: "lightgrey" },
	{ name: "Antarctica", color: "lightgrey" },
	{ name: "Oceania", color: "#7fee0e" }
];

function highlightContinents() {
	continentsInfo.forEach((continentInfo) => {
		d3.select("." + continentInfo.name.toLocaleLowerCase().replace(" ", "-"))
			.style("color", continentInfo.color);
	});
}

function createMap(mapContainer) {
	var width = 380;
	var height = 380;
	var shiftx = -40;
	var shifty = -20;

	var projection = d3.geo.stereographic()
		.scale(85)
		.translate([width / 2 + shiftx, height / 2 + shifty])
		.rotate([-20, 0])
		.clipAngle(180 - 1e-4)
		.clipExtent([[0, 0], [width, height]])
		.precision(.1);

	var path = d3.geo.path().projection(projection);

	var svg = d3.select(mapContainer).append("svg")
		.attr("width", width)
		.attr("height", height);

	//var tooltip = d3.select(mapContainer).append("div").attr("class", "tooltip hidden");

	d3.json("continent-geogame-110m.json.txt", function (error, world) {
		var countries = topojson.feature(world, world.objects.countries);

		var continents = continentsInfo.map(function (continentInfo, i) {
			return { type: "FeatureCollection", name: continentInfo.name, color: continentInfo.color, id: i, features: countries.features.filter(function (d) { return d.properties.continent == continentInfo.name; }) };
		});

		var continent = svg.selectAll(".continent").data(continents);

		continent.enter().insert("path")
			.attr("class", "continent")
			.attr("d", path)
			.attr("id", function (d, i) { return d.id; })
			.attr("title", function (d, i) { return d.name; })
			.style("fill", function (d, i) { return d.color; });
		/*
		continent
			.on("mousemove", function (d, i) {
				var mouse = d3.mouse(svg.node()).map(function (d) { return parseInt(d); });
				tooltip
					.classed("hidden", false)
					.attr("style", "left:" + (mouse[0] + 30 + shiftx) + "px; top:" + (mouse[1] - 30 + shifty - height) + "px")
					.html(d.name);
			})
			.on("mouseout", function (d, i) {
				tooltip.classed("hidden", true);
			});
		//*/
		svg.append("path")
			.datum(d3.geo.graticule())
			.attr("id", "graticule")
			.attr("d", path);
	});
}
