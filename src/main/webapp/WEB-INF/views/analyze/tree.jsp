<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type"	content="text/html;charset=utf-8">
		<title>Tree</title>
		<style type="text/css">
			circle {
			  cursor: pointer;
			  fill: #fff;
			  stroke: steelblue;
			  stroke-width: 1.5px;
			}

			text {
				font-size:10px;
			}

			path.link {
			  fill: none;
			  stroke: #ccc;
			  stroke-width: 1.5px;
			}
			
			text-center {
				text-align: center;
			}
			
			/* form {
			  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
			  position: absolute;
			  left: 10px;
			  top: 10px;
			}
			
			label {
			  display: block;
			} */
		</style>
		<script type="text/javascript" src="http://d3js.org/d3.v3.min.js"></script>
		<script type="text/javascript" src="http://d3js.org/d3.v4.min.js"></script>
    	<script type="text/javascript" src="/paypal/resources/js/d3.layout.js"></script>
    	<script type="text/javascript" src="/paypal/resources/js/jquery-3.1.1.js"></script>
    	<script type="text/javascript" src="/paypal/resources/js/draw-chart.js"></script>
	</head>
	<body>
		<h1 class="text-center">Data Analysis Chart</h1>
		<div id="search-conditions">
			<form id="conditions">
				<div id="product-div">
					<input id="product-single" type="radio" name="group" value="S" checked="checked">&nbsp;단일상품 &nbsp;&nbsp;&nbsp; 
					<input id="product-group" type="radio" name="group" value="G">&nbsp;묶음상품
					<br><br>
				</div>
				<div id="gender-div">
					<input id="gender-a" type="radio" name="gender" value="All" checked="checked">&nbsp;전체 &nbsp;&nbsp;&nbsp; 
					<input id="gender-m" type="radio" name="gender" value="M">&nbsp;남자 &nbsp;&nbsp;&nbsp; 
					<input id="gender-f" type="radio" name="gender" value="W">&nbsp;여자 &nbsp;&nbsp;&nbsp; 
					<input id="gender-c" type="radio" name="gender" value="C">&nbsp;비교
					<br><br>
				</div>
				<div id="age-div">
					<input id="age-a" type="checkbox" name="age" value="All" checked="">&nbsp;전체&nbsp;&nbsp;&nbsp;
					<input id="age-ax1" type="checkbox" name="age" value="1">&nbsp;10대&nbsp;&nbsp;&nbsp;
					<input id="age-ax2" type="checkbox" name="age" value="2">&nbsp;20대&nbsp;&nbsp;&nbsp;
					<input id="age-ax3" type="checkbox" name="age" value="3">&nbsp;30대&nbsp;&nbsp;&nbsp;
					<input id="age-ax4" type="checkbox" name="age" value="4">&nbsp;40대&nbsp;&nbsp;&nbsp;
					<input id="age-ax5" type="checkbox" name="age" value="5">&nbsp;50대&nbsp;&nbsp;&nbsp;
					<input id="age-ax6" type="checkbox" name="age" value="6">&nbsp;60대 이상&nbsp;&nbsp;&nbsp;
					<br><br>
				</div>
				<div id="area-div">
					<input id="area-a" type="checkbox" name="area" value="All">&nbsp;전체&nbsp;&nbsp;&nbsp;
					<input id="area-ar1" type="checkbox" name="area" value="서울">&nbsp;서울&nbsp;&nbsp;&nbsp;
					<input id="area-ar2" type="checkbox" name="area" value="경기">&nbsp;경기&nbsp;&nbsp;&nbsp;
					<input id="area-ar3" type="checkbox" name="area" value="강원">&nbsp;강원&nbsp;&nbsp;&nbsp;
					<input id="area-ar4" type="checkbox" name="area" value="충북">&nbsp;충북&nbsp;&nbsp;&nbsp;
					<input id="area-ar5" type="checkbox" name="area" value="충남">&nbsp;충남&nbsp;&nbsp;&nbsp;
					<input id="area-ar6" type="checkbox" name="area" value="대전">&nbsp;대전&nbsp;&nbsp;&nbsp;
					<input id="area-ar7" type="checkbox" name="area" value="전북">&nbsp;전북&nbsp;&nbsp;&nbsp;
					<input id="area-ar8" type="checkbox" name="area" value="전남">&nbsp;전남&nbsp;&nbsp;&nbsp;
					<input id="area-ar9" type="checkbox" name="area" value="광주">&nbsp;광주&nbsp;&nbsp;&nbsp;
					<input id="area-ar10" type="checkbox" name="area" value="경북">&nbsp;경북&nbsp;&nbsp;&nbsp;
					<input id="area-ar11" type="checkbox" name="area" value="대구">&nbsp;대구&nbsp;&nbsp;&nbsp;
					<input id="area-ar12" type="checkbox" name="area" value="경남">&nbsp;경남&nbsp;&nbsp;&nbsp;
					<input id="area-ar13" type="checkbox" name="area" value="부산">&nbsp;부산&nbsp;&nbsp;&nbsp;
					<input id="area-ar14" type="checkbox" name="area" value="울산">&nbsp;울산&nbsp;&nbsp;&nbsp;
					<br><br>
				</div>
				<div id="period-div">
					<input id="period-a" type="radio" name="period" value="All" checked="checked">&nbsp;전체기간&nbsp;&nbsp;&nbsp;
					<input id="period-year" type="radio" name="period" value="Year">&nbsp;연도별&nbsp;&nbsp;&nbsp;
					<input id="period-quater" type="radio" name="period" value="Quater">&nbsp;분기별&nbsp;&nbsp;&nbsp;
					<input id="period-month" type="radio" name="period" value="Month">&nbsp;월별&nbsp;&nbsp;&nbsp;
					<input id="period-specified" type="radio" name="period" value="Specified">&nbsp;특정기간&nbsp;&nbsp;&nbsp;
					<span id="period-span">
						<input id="periodFrom" type="date" name="periodFrom">&nbsp;~&nbsp;<input id="periodTo" type="date" name="periodTo">
					</span>
					<br><br>
				</div>
				<input type="hidden" name="treeNodeName">
				<input type="hidden" name="treeNodeDepth">
				<input type="hidden" name="xAxisLabel">
				<input type="hidden" name="ageAllClicked">
				<input type="hidden" name="areaAllClicked">
				<input type="hidden" id="config">
			</form>
			<div id="analyze-div">
				<input type="button" name="analyze" value="분석">&nbsp;
				<input type="button" name="view-tree" value="트리보기">
			</div>
		</div>
		<br><br>
		
		<script type="text/javascript">
			// x축 레이블
			var xAxisLabel;
			var areaAxisLabel = ["서울", "부산", "대구", "광주", "대전", "울산", "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남"];
			var xLabel = [];
			//==========
			
			var w;
			var h;
			var i;
			var duration;
			var root;			
			// 검색 및 분석
			var treeNodeName = "";
			var treeNodeDepth = "";			
			var tree;
			var diagonal;			
			var vis;
			
			initTreeVariables();
			// ===================== 이상 트리 차트의 변수와 초기화
			var n, // The number of series.
		    	m; // The number of values per series.		    	
	    	// 색상
			var color;    	
			var xz,
			    yz,
			    y01z,
			    yMax,
			    y1Max;
			
			var svg,
			    margin,
			    width,
			    height,
			    g;
			
			var x;			
			var y;			
			var series;
			var xn;
			var genders = [];
			var ages = [];
			var seriesIndex = 0;
			
			// 막대그래프의 사각형
			var rect;
			
			// 분석데이터
			var condition;
			var analData;
			var values = [];
			// ==================== 이상 막대 그래프의 변수와 초기화
			function showTree() { d3.json("/paypal/resources/data/p.json", function(json) {
					json.x0 = 800;
				  	json.y0 = 0;
				  	root = "";
				  	update(root = json);
				  	// console.log("c :" + tree.nodes(root));
				});
			}			
			
			function update(source) {
				// Compute the new tree layout
				// reverse()는 노드 클릭시 텍스트의 각도
				// console.log("v_---------\n" + root);
				var nodes = tree.nodes(root).reverse();
				// console.log("d :" + tree.nodes(root));
				// console.log(nodes);
				// Update the nodes
				var node = vis.selectAll("g.node")
							  .data(nodes, function(d) {
									return d.id || (d.id = ++i);
							  });
				var nodeEnter = node.enter().append("svg:g")
									.attr("class", "node")
									.attr("transform", function(d) {
										// 노드와 엣지의 이동
											return "translate(" + source.y0 + ", " + source.x0 + ")";
									});
				
				// 노드의 크기, 색상변화
				nodeEnter.append("svg:circle")
						 .attr("r", 7)
						 .style("fill", function(d) {
								return d._children ? "lightsteelblue" : "#fff";
						 }).attr("id", function(d) {
							return "node-" + d.name + "-" + d.depth;
						 })
						 .on("click", click);
				
				// 텍스트(노드)
				nodeEnter.append("svg:text")
						 .attr("x", function(d) {
								return d._children ? -8 : 8;
						 })
						 .attr("y", 3)
						 .text(function(d) {							 	
								return d.name;
						 })
						 .on("click", selectNode);
						 
				// Transition node to their position
				// 점(노드)
				nodeEnter.transition()
						 .duration(duration)
						 .attr("transform", function(d) {
								return "translate(" + d.y + ", " + d.x + ")";
						 })
						 .style("opacity", 1)
						 .select("circle")
						 .style("fill", "lightsteelblue");
						 
				node.transition()
					.duration(duration)
					.attr("transform", function(d) {
						// 텍스트 이동
							return "translate(" + d.y + ", " + d.x + ")";
					})
					.style("opacity", 1);
				node.exit().transition()
					.duration(duration)
					.attr("transform", function(d) {
							return "transition(" + source.y + ", " + source.x + ")";
					})
					.style("opacity", 1)
					.remove();
					
				// 엣지
				var link = vis.selectAll("path.link")
							  .data(tree.links(nodes), function(d) {
									return d.target.id;
							  });
							  
				// Enter any new links at the parent's previous position
				link.enter().insert("svg:path", "g").attr("class", "link").attr("d", function(d) {
						// 엣지 방향
						var o = {x: source.x0, y: source.y0};
						return diagonal({source: o, target: o});
					})
					.transition()
					.duration(duration)
					.attr("d", diagonal);
					
				// Transition links to their new position
				link.transition().duration(duration).attr("d", diagonal);
				
				// Transition exiting nodes to their parent's position
				link.exit().transition().duration(duration).attr("d", function(d) {
						var o = {x: source.x, y: source.y};
						return diagonal({source: o, target: o});
					}).remove();
					
				// Stash the old positions to transition
				nodes.forEach(function(d) {
					d.x0 = d.x;
					d.y0 = d.y;
				});
			}
			
			// Toggle children on click
			function click(d) {
				if (d.children) {
					d._children = d.children;
					d.children = null;
				} else {
					d.children = d._children
					d._children = null;
				}
				update(d);
			}
			
			// Node Name Click Event
			function selectNode(d) {
				var id = "node-" + d.name + "-" + d.depth;
				$("circle").each(function() {
					if (id === $(this).attr("id")) {
						$(this).css("fill", "red");
						treeNodeName = id.split("-")[1];
						treeNodeDepth = id.split("-")[2];
					} else {
						$(this).css("fill", "lightsteelblue");
					}
				});
			}
			
			// single product event
			function selectSingleProduct() {
				var productChosenCount = 0;
				$("circle").each(function() {
					if ($(this).css("fill").indexOf("rgb(255,") >= 0) { // red
						productChosenCount++;
					}
				});
				
				if (productChosenCount === 0) {
					var id = $("circle[id$='-0']").attr("id");
					$("circle").each(function() {
						if (id === $(this).attr("id")) {
							$(this).css("fill", "red");
							treeNodeName = id.split("-")[1];
							treeNodeDepth = id.split("-")[2];
						} else {
							$(this).css("fill", "lightsteelblue");
						}
					});
				}				
			}
			// ========================================= 이상 트리차트의 함수
			
			// 분석된 막대그래프 보이기
			function showBarChart() {
				rect.transition()
				    .delay(function(d, i) { return i * 10; })
				    .attr("y", function(d) { return y(d[1]); })
				    .attr("height", function(d) { return y(d[0]) - y(d[1]); });				
				
				// X Axis
				g.append("g")
				    .attr("class", "axis axis--x")
				    .attr("transform", "translate(0," + height + ")")
				    .call(d3.axisBottom(x)
				        .tickSize(0)
				        .tickPadding(6))
			        .selectAll("text")
			        .attr("transform", "rotate(0)") // -60
			        .attr("dx", "-.8em")
			        .attr("dy", ".25em")
			        .style("text-anchor", "end")
			        .style("font-size", "12px");
				
				// Y Axis
				g.append("g")
			    .attr("class", "axis axis--y")
			    .attr("transform", "translate(0, 0)")
			    .call(d3.axisLeft(y)
			        .tickSize(0)
			        .tickPadding(6))
			    .attr("font-size", "12px");
				
				d3.selectAll("input")
				    .on("change", changed);
			}
			
			var timeout = d3.timeout(function() {
				d3.select("input[value=\"grouped\"]")
			      .property("checked", true)
			      .dispatch("change");
			}, 2000);
			
			function changed() {
				timeout.stop();
			  	if (this.value === "grouped") {
			  		transitionGrouped();
			  	} else if (this.value === "stacked") {
			  		transitionStacked();
			  	}
			}
			
			function transitionGrouped() {
				y.domain([0, yMax]);
			
			  	rect.transition()
			      	.duration(500)
			      	.delay(function(d, i) { 
			      		// i = m * n : (0 ~ m) * n
			      		return i * 10; })
			      	.attr("x", function(d, i) {
			      		return xn(i) + xn.bandwidth() / n * this.parentNode.__data__.key; })
			      	.attr("width", x.bandwidth() / n)
			    	.transition()
			      	.attr("y", function(d) { return y(d[1] - d[0]); })
			      	.attr("height", function(d) { return y(0) - y(d[1] - d[0]); });
			  	seriesIndex = 0;
			}
			
			function transitionStacked() {
				y.domain([0, y1Max]);
			
			  	rect.transition()
			      	.duration(500)
			      	.delay(function(d, i) { return i * 10; })
			      	.attr("y", function(d) { return y(d[1]); })
			      	.attr("height", function(d) { return y(d[0]) - y(d[1]); })
			    	.transition()
			      	.attr("x", function(d, i) { return xn(i); })
			      	.attr("width", x.bandwidth());
			  	seriesIndex = 0;
			}
			
			// 분석 데이터 구성
			function bumps(m) {				
				if (condition.gender === "C") {
					genders[0] = "M";
					genders[1] = "W";
				} else if (condition.gender === "M") {
					genders[0] = "M";
				} else if (condition.gender === "W") {
					genders[0] = "W";
				} else {
					genders[0] = "All";
				}
				
				if (condition.age[0] === "All") {
					ages[0] = 0;
				} else {
					ages = condition.age;
				}
				
				var values = [], i, j, w, x, y, z;
				var period = "";
				var prodName = "";
				var periodName = "";
			
				var xValue = "";
				var l = 0;
				var t = 0;
			  	
				// Initialize with analized data
				var temp = [];
				for (var i = 0; i < genders.length; i++) {
					for (var j = 0; j < ages.length; j++) {
						temp[t] = {};
						temp[t].gender = genders[i];
						temp[t++].age = ages[j];
					}
				}
				
				for ( ; seriesIndex < temp.length; ) {
					for (var k = 0; k < xLabel.length; k++) {
						var seriesData = {};
						seriesData.xAxisLabel = xLabel[k];
						seriesData.gender = temp[seriesIndex].gender;
						seriesData.age = temp[seriesIndex].age;
						
						values[l++] = setValue(seriesData);
					}
					seriesIndex++;
					break;
				}

				return values;
			}
			
			function setValue(seriesData) {
				for (var i = 0; i < analData.length; i++) {
					if (condition.xAxisLabel === "product") {
						if (condition.treeNodeDepth === "0" || condition.treeNodeDepth === "3") {
		  					prodName = analData[i].productName;
		  				} else if (condition.treeNodeDepth === "1") {
		  					prodName = analData[i].category1;
		  				} else if (condition.treeNodeDepth === "2") {
		  					prodName = analData[i].category2;
		  				}
						
						if (!!analData[i] && analData[i].gender === seriesData.gender && analData[i].age == seriesData.age && prodName === seriesData.xAxisLabel) {
							if (!!analData[i].quantity) {
								value = analData[i].quantity;
								break;
							} else {
								value = 0;
								break;
							}
						} else {
							value = 0;
							break;
						}
					} else if (condition.xAxisLabel === "period") {
						if (condition.period === "Year") {
			  				periodName = seriesData.year;
			  			} else if (condition.period === "Quater") {
			  				periodName = seriesData.year + "년 " + seriesData.quater + "분기";
			  			} else if (condition.period === "Month") {
			  				periodName = seriesData.year + "년 " + seriesData.month + "월";
			  			} else if (condition.period === "Specified") {
			  				periodName = condition.periodFrom + " ~ " + condition.periodTo;
			  			} else if (condition.period === "All") {
			  				periodName = "전체";
			  			}
			  			
						if (!!analData[i] && analData[i].gender === seriesData.gender && analData[i].age == seriesData.age && periodName === seriesData.xAxisLabel) {
							if (!!analData[i].quantity) {
								value = analData[i].quantity;
								break;
							} else {
								value = 0;
								break;
							}
						} else {
							value = 0;
							break;
						}
					} else if (condition.xAxisLabel === "area") {
						if (!!analData[i] && analData[i].gender === seriesData.gender && analData[i].age === seriesData.age && analData[i].address === seriesData.xAxisLabel) {
							if (!!analData[i].quantity) {
								value = analData[i].quantity;
								break;
							} else {
								value = 0;
								break;
							}
						} else {
							value = 0;
							break;
						}
					}
				}
  				return value;
			}
			// ==================================== 이상 막대그래프의 함수
			/**
			 * 막대그래프 그리는 순서
			 * 1. showBarChart();
			 * 2. timeout();
			 * 3. changed();
			 * 4. transitionGrouped();
			 * 5. changed();
			 * 6. transitionStacked();
			 * 7. changed();
			 * 8. transitionGrouped();
			 */
			
			// 모든 변수 초기화하는 함수
			function initTreeVariables() {
				w = 1360;
				h = 800;
				i = 0;
				duration = 3000;
				root;
				
				// 검색 및 분석
				treeNodeName = "";
				treeNodeDepth = "";
				
				tree = d3.layout.tree().size([h, w - 360]);
				diagonal = d3.svg.diagonal().projection(function(d) {
					return [d.y, d.x];
				});
				
				vis = d3.select("#chart").append("svg:svg")
							.attr("width", w)
							.attr("height", h)
							.append("svg:g")
							.attr("transform", "translate(200, 0)");
			 }
			 
			 function initBarVariables(_condition, _data, _xAxisLabel) {
				// 분석조건과 데이터 대입
				condition = _condition;
				analData = _data;
				xAxisLabel = _xAxisLabel;
				//=====
				var genderLength = 1;
				var ageLength = 0;
				if (condition.gender === "C") {
					genderLength = 2;
				}
				if (condition.age[0] === "All") {
					ageLength = 1;
				} else {
					ageLength = condition.age.length;
				}
				
				n = genderLength * ageLength, // 성별 * 연령
			    m = xAxisLabel.length; // The number of values per series.
			    
		    	// 색상
				color = d3.scaleOrdinal()
				    .domain(d3.range(n))
				    .range(d3.schemeCategory20c);
			    
			    for (var i = 0; i < xAxisLabel.length; i++) {
			    	xLabel[i] = xAxisLabel[i].label;
			    }
				xz = d3.range(xLabel.length),
				yz = d3.range(n).map(function() { return bumps(m); }),
				y01z = d3.stack().keys(d3.range(n))(d3.transpose(yz)),
				yMax = d3.max(yz, function(y) { return d3.max(y); }),
				y1Max = d3.max(y01z, function(y) { return d3.max(y, function(d) { return d[1]; }); });
				
				svg = d3.select("svg"),
				margin = {top: 40, right: 10, bottom: 20, left: 30},
				width = svg.attr("width") - margin.left - margin.right,
				height = svg.attr("height") - margin.top - margin.bottom,
				g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");
				
				x = d3.scaleBand()
				    .domain(xLabel)
				    .rangeRound([0, width])
				    // bar group 간격
				    .padding(0.08);
				
				xn = d3.scaleBand()
			    .domain(xz)
			    .rangeRound([0, width])
			    // bar group 간격
			    .padding(0.3);
				
				y = d3.scaleLinear()
				    .domain([0, Math.ceil(y1Max)])
				    // bar의 시작위치
				    .range([height, 0]);
				
				timeout = d3.timeout(function() {
					d3.select("input[value=\"grouped\"]")
				      .property("checked", true)
				      .dispatch("change");
				}, 2000);
				
				series = g.selectAll(".series")
					.data(y01z)
					.enter().append("g")
				    .attr("fill", function(d, i) { return color(i); });
			
				// 막대그래프의 사각형
				rect = series.selectAll("rect")
					.data(function(d) { return d; })
					.enter()
					.append("rect")
				    .attr("xl", function(d, i) { return xn(i); })
				    .attr("y", height)
				    .attr("width", x.bandwidth())
				    .attr("height", 0);
			}
		</script>
	</body>
</html>
