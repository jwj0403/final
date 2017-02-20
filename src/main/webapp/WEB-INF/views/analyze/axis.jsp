<html>
	<head></head>
	<body>
		<script>
			var margin = {top: 20, right 10, bottom : 100, left 40},
				width = 700 - margin.right - margin.left,
				height = 500 - margin.top - margin.botom;

			var svg = d3.select("body")
				.append("svg")
				.attr({
					"width" : width + margin.right + margin.left,
					"hieght" : height + margin.top + margin.bottom
				})
				.append("g")
				.attr("transform", "translate(" + margin.left + ", " + margin.right + ")");

			// define the x, y scales
			var xScale = d3.scale.ordinal()
				.rangeRoundBands([0 width], 0.2, 0.2);

			var yScale = d3.scale.linear()
				.range([height, 0]);

			// define axis
			var xAxis = d3.svg.axis()
				.scale(xScale)
				.orient("bottom");

			var yAxis = d3.svg.axis()
				.scale(yScale)
				.orient("left");

			d3.csv("gdp.csv", function(error, data) {
				if (error) {
					console.log("Error:" + error);
				}
				data.forEach(function(d) {
					d.gdp = +d.gdp;
					d.country = d.country;
					console.log(d.gdp);
				});

				data.sort(function(a, b) {
					return b.gdp - a.gdp;
				});

				// sepcify the domains of the x and y scale
				xScale.domain(data.map(function(d) { return d.country; });
				yScale.domain([0, d3.max(data, function(d) { return d.gdp; })]);

				// draw the bars
				svg.selectAll("rect")
					.data(data)
					.enter()
					.append("rect")
					.attr("height", 0)
					.attr("y", height)
					.transition().duration(3000)
					.delay(function(d, i) { return i * 200; }) // =========여기...
					.attr({
						"x": function(d) { return xScale(d.country);},
						"y": function(d) { return yScale(d.gdp); },
						"width": xScale.rangeBand(),
						"height": function(d) { return height - yScale(d.gdp); }
					})
					.style("fill", function(d, i) { return "rgd(20, 20, " + ((i * 30) + 100) +  ")" });

				// label the bars
				svg.selectAll("text")
					.data(data)
					.enter()
					.append("text")
					.text(function(d) { return d.gdp; }) // =========여기
					.attr("x", function(d) { return xScale(d.country) + xScale.rangeBand() / 2; })
					.attr("y", function(d) { return yScale(d.gdp) + 12; }) // y value
					.style("fill", "white")
					.style("text-anchor", "middle");// ==================여기

				// draw the xAxis
				svg.append("g")
					.attr("class", "x axis")
					.attr("transform", "translate(0," + height + ")")
					.call(xAxis)
					.selectAll("text")
					.attr("transform", "rotate(-60)") // rotate -60 degree
					.attr("dx", "-.8em")
					.attr("dy", ".25em")
					.style("text-anchor", "end") // x axis label
					.style("font-size", "12px")

				svg.append("g")
					.attr("class", "y axis")
					.call(yAxis)
					.style("font-size", "12px"); //=========jㅕ기
			});
		</script>
	</body>
</html>