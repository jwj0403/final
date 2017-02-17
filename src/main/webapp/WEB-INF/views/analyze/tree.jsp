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
    	<script type="text/javascript">
    		$("document").ready(function() {
    			// 검색옵션 보이기
    			showConditions("show");
    			
    			// 기간입력창 숨기기
    			$("#period-span").hide();
    			
    			// 검색옵션에 이벤트 걸기
    			// 나이
    			$("input[id^='age-a']").prop("checked", true); // 페이지 로드시.
    			$("#age-a").on("click", function() {
    				if ($(this).prop("checked") === true) {
    					$("input[id^='age-ax']").prop("checked", true);
    				} else {
    					$("input[id^='age-ax']").prop("checked", false);
    				}
    			});
    			$("input[id^='age-ax']").each(function() {
    				$(this).on("click", function() {
    					if ($("#age-ax1").prop("checked") && $("#age-ax2").prop("checked") && $("#age-ax3").prop("checked") && $("#age-ax4").prop("checked") && $("#age-ax5").prop("checked") && $("#age-ax6").prop("checked")) {
        					$("#age-a").prop("checked", true);
        				} else {
        					$("#age-a").prop("checked", false);
        				}
    				});
    			});
    			
    			// 지역
    			$("#area-a").prop("checked", false); // 페이지 로드시.
    			$("#area-a").on("click", function() {
    				if ($(this).prop("checked") === true) {
    					$("input[id^='area-ar']").prop("checked", true);
    				} else {
    					$("input[id^='area-ar']").prop("checked", false);
    				}
    			});
    			$("input[id^='area-ar']").each(function() {
    				$(this).on("click", function() {
    					if ($("#area-ar1").prop("checked") && $("#area-ar2").prop("checked") && $("#area-ar3").prop("checked") && $("#area-ar4").prop("checked") 
    							&& $("#area-ar5").prop("checked") && $("#area-ar6").prop("checked") && $("#area-ar7").prop("checked") && $("#area-ar8").prop("checked") 
    							&& $("#area-ar9").prop("checked") && $("#area-ar10").prop("checked") && $("#area-ar11").prop("checked") && $("#area-ar12").prop("checked") 
    							&& $("#area-ar13").prop("checked") && $("#area-ar14").prop("checked")) {
        					$("#area-a").prop("checked", true);
        				} else {
        					$("#area-a").prop("checked", false);
        				}
    					
    					var count = $("input[id^='area-ar']:checked").length; // 지역 체크박스 중 체크된 지역의 개수
    					if (count > 1) { // 지역 데이터가 1 지역 이상이면,
    						$("#product-single").click(); //----------------------------------------------------- 단일상품 클릭시 이벤트 걸어주기
    						selectSingleProduct();
    						$("#period-a").prop("checked", true); //---------------------------------------------------------- 전체기간 클릭시 이벤트 걸어주기
    					}
    				});
    			});
    			
    			// 기간
    			$("input[name='period']").each(function() {
    				$(this).on("click", function() {
    					if ($(this).val() === "Specified") {
        					$("#period-span").show();
        				} else {
        					$("#period-span").hide();
        				}
    					
    					if ($(this).val() === "Year" || $(this).val() === "Quater" || $(this).val() === "Month") {
    						$("#product-single").click(); //----------------------------------------------------- 단일상품 클릭시 이벤트 걸어주기
    						selectSingleProduct();
    						if ($(this).prop("checked") === true) { // 지역
    	    					var areaCount = $("input[id^='area-ar']:checked").length;
    	    					if (areaCount !== 1 ) {
    	    						if ($("#area-a").prop("checked") === false) {
    	    							$("#area-a").click();
    	    						}
    	    					}
    	    				}
    					}
    				});
    			});
    			
    			// 상품
    			$("#product-group").on("click", function() {
    				if ($(this).prop("checked") === true) { // 지역
    					var areaCount = $("input[id^='area-ar']:checked").length;
    					if (areaCount !== 1 ) {
    						if ($("#area-a").prop("checked") === false) {
    							$("#area-a").click();
    						}
    					}
    				}
    				
    				$("#period-a").click(); // 기간
    			});
    			
    			// 분석
    			$("input[name='analyze']").on("click", function() {
    				// 특정기간 선택시 validation
    				if ($("#period-specified").prop("checked") === true) {
    					var fromValue = $("#periodFrom").val();
    					var toValue = $("#periodTo").val();
    					if (fromValue === "" || fromValue === null || fromValue === undefined) {
    						alert("검색시작기간을 입력하십시오.");
    						return;
    					}
    					if (toValue === "" || toValue === null || toValue === undefined) {
    						alert("검색종료기간을 입력하십시오.");
    						return;
    					}
    					var fromValueNumber = parseInt(fromValue.replace("-", ""));
    					var toValueNumber = parseInt(toValue.replace("-", ""));
    					if (fromValueNumber > toValueNumber) {
    						alert("검색시작일자가 검색종료일자보다 클 수 없습니다.");
    						return;
    					}
    				}
    				
    				// 데이터 전송
    				var xAxisLabel = ""; // x 축 레이블
    				if ($("#product-group").prop("checked") === true) {
    					xAxisLabel = "product";
    				} else if ($("#period-year").prop("checked") === true || $("#period-quater").prop("checked") === true || $("#period-month").prop("checked") === true) {
    					xAxisLabel = "period";
    				} else {
    					xAxisLabel = "area";
    				}
    				$("input[name='xAxisLabel']").val(xAxisLabel);
    				
    				// ajax
    				// 연령데이터
    				var ageData = "";
    				$("input[id^='age-']:checked").each(function() {
    					ageData += $(this).val() + "@";
    				});
    				// 지역데이터
    				var areaData = "";
    				$("input[id^='area-']:checked").each(function() {
    					areaData += $(this).val() + "@";
    				});
    				
    				$("input[name='treeNodeName']").val(treeNodeName);
    				$("input[name='treeNodeDepth']").val(treeNodeDepth);
    				if ($("#age-a").prop("checked") === true) {
    					$("input[name='ageAllClicked']").val("Checked");
    				} else {
    					$("input[name='ageAllClicked']").val("Not-Checked");
    				}
    				if ($("#area-a").prop("checked") === true) {
    					$("input[name='areaAllClicked']").val("Checked");
    				} else {
    					$("input[name='areaAllClicked']").val("Not-Checked");
    				}
    				
    				$.ajax({
    					type: "GET",
    					url: "../analyze/analyze.action",
    					data: $("#conditions").serialize(),
	    				success: function(data, textStatus) {
	    					//alert("d : " + data);
	    					//alert("t : " + textStatus);
	    					$("input[name='load']").val("loaded");
	    					showBarChart();
	    				},
    					error: function (xhr, textStatus, error) {
    						alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
    				    }
    				});
    			});
    			
    			// 상품트리 로드
    			loadProductTree();
    			
    			$("input[name='view-tree']").on("click", function() {
    				loadProductTree();
    			});
    		});
    		
    		// 트리 보기
    		function loadProductTree() {
    			alert("aa");
    			// 상품트리 로드
    			if ($("input[name='load']").val() === "init") {
					$.getJSON("../analyze/productTreeChart.action", 
						function(data, status, xhr) {
							showTree();
						}
					);
    			}
    		}
    		
    		function showConditions(flag) {
    			
    			alert("ab");
    			if (flag === "show") {
	    			$("#gender-div").show();
	    			$("#age-div").show();
	    			$("#area-div").show();
	    			$("#period-div").show();
	    			$("#product-div").show();
	    			$("#search-conditions").show();
    			} else if (flag === "hide") {
    				$("#gender-div").hide();
	    			$("#age-div").hide();
	    			$("#area-div").hide();
	    			$("#period-div").hide();
	    			$("#product-div").hide();
	    			$("#search-conditions").hide();
    			}
    		}
    	</script>
		
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
				<input type="hidden" name="load" value="init">
				<input type="hidden" id="config">
			</form>
			<div id="analyze-div">
				<input type="button" name="analyze" value="분석">&nbsp;
				<input type="button" name="view-tree" value="트리보기">
			</div>
		</div>
		<div id="chart"></div>
		
		<script type="text/javascript">
			var w = 1360;
			var h = 800;
			var i = 0;
			var duration = 3000;
			var root;
			
			// 검색 및 분석
			var treeNodeName = "";
			var treeNodeDepth = "";
			
			var tree = d3.layout.tree().size([h, w - 360]);
			var diagonal = d3.svg.diagonal().projection(function(d) {
				alert("an");
				return [d.y, d.x];
			});
			
			var vis = d3.select("#chart").append("svg:svg")
						.attr("width", w)
						.attr("height", h)
						.append("svg:g")
						.attr("transform", "translate(200, 0)");
			
			var n = 12, // The number of series.
		    	m = 17; // The number of values per series.
		    
		    	
	    	// 색상
			var color = d3.scaleOrdinal()
			    .domain(d3.range(n))
			    .range(d3.schemeCategory20c);
	    	
			var xz = d3.range(m),
			    yz = d3.range(n).map(function() { 
			    	alert("ao");
			    	return bumps(m); }),
			    y01z = d3.stack().keys(d3.range(n))(d3.transpose(yz)),
			    yMax = d3.max(yz, function(y) { 
			    	alert("ap");
			    	return d3.max(y); }),
			    y1Max = d3.max(y01z, function(y) { 
			    	alert("aq");
			    	return d3.max(y, function(d) { 
			    		alert("ar");
			    		return d[1]; }); });
			
			var svg = d3.select("svg"),
			    margin = {top: 40, right: 10, bottom: 20, left: 10},
			    width = svg.attr("width") - margin.left - margin.right,
			    height = svg.attr("height") - margin.top - margin.bottom,
			    g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");
			
			var x = d3.scaleBand()
			    .domain(xz)
			    .rangeRound([0, width])
			    // bar group 간격
			    .padding(0.3);
			
			var y = d3.scaleLinear()
			    .domain([0, y1Max])
			    // bar의 시작위치
			    .range([height, 0]);
			
			var series = g.selectAll(".series")
				.data(y01z)
				.enter().append("g")
			    .attr("fill", function(d, i) { 
			    	alert("as");
			    	return color(i); });
			
			// 막대그래프의 사각형
			var rect = series.selectAll("rect")
				.data(function(d) { 
					alert("at");
					return d; })
				.enter().append("rect")
			    .attr("x", function(d, i) { 
			    	alert("au");
			    	return x(i); })
			    .attr("y", height)
			    .attr("width", x.bandwidth())
			    .attr("height", 0);
			
			
			function showTree() {
				alert("ac");
				d3.json("/paypal/resources/data/p.json", function(json) {
					json.x0 = 800;
				  	json.y0 = 0;
				  	root = "";
				  	update(root = json);
				  	// console.log("c :" + tree.nodes(root));
				});
			}
				
			
			
			function update(source) {
				alert("ad");
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
				alert("ae");
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
				alert("af");
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
				alert("ag");
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
			
			// 분석된 막대그래프 보이기
			function showBarChart() {
				alert("ah");
				rect.transition()
				    .delay(function(d, i) { return i * 10; })
				    .attr("y", function(d) { return y(d[1]); })
				    .attr("height", function(d) { return y(d[0]) - y(d[1]); });
				
				
				g.append("g")
				    .attr("class", "axis axis--x")
				    .attr("transform", "translate(0," + height + ")")
				    .call(d3.axisBottom(x)
				        .tickSize(0)
				        .tickPadding(6));
				
				d3.selectAll("input")
				    .on("change", changed);
			}
			
			var timeout = d3.timeout(function() {
				alert("ai");
				d3.select("input[value=\"grouped\"]")
			      .property("checked", true)
			      .dispatch("change");
			}, 2000);
			
			function changed() {
				alert("aj");
				timeout.stop();
			  	if (this.value === "grouped") {
			  		transitionGrouped();
			  	} else if (this.value === "stacked") {
			  		transitionStacked();
			  	}
			}
			
			function transitionGrouped() {
				alert("ak");
				y.domain([0, yMax]);
			
			  	rect.transition()
			      	.duration(500)
			      	.delay(function(d, i) { 
			      		// i = m * n : (0 ~ m) * n
			      		return i * 10; })
			      	.attr("x", function(d, i) {
			      		return x(i) + x.bandwidth() / n * this.parentNode.__data__.key; })
			      	.attr("width", x.bandwidth() / n)
			    	.transition()
			      	.attr("y", function(d) { return y(d[1] - d[0]); })
			      	.attr("height", function(d) { return y(0) - y(d[1] - d[0]); });
			}
			
			function transitionStacked() {
				alert("al");
				y.domain([0, y1Max]);
			
			  	rect.transition()
			      	.duration(500)
			      	.delay(function(d, i) { return i * 10; })
			      	.attr("y", function(d) { return y(d[1]); })
			      	.attr("height", function(d) { return y(d[0]) - y(d[1]); })
			    	.transition()
			      	.attr("x", function(d, i) { return x(i); })
			      	.attr("width", x.bandwidth());
			}
			
			// 분석 데이터 구성
			function bumps(m) {
				alert("am");
				var values = [], i, j, w, x, y, z;
			
			  	// Initialize with uniform random values in [0.1, 0.2).
			  	for (i = 0; i < m; ++i) {
			    	values[i] = 0.1 + 0.1 * Math.random();
			    	// console.log(i + ": " + values[i]);
			  	}
			
			  	/* // Add five random bumps.
			  	for (j = 0; j < 5; ++j) {
			    	x = 1 / (0.1 + Math.random());
			    	y = 2 * Math.random() - 0.5;
			    	z = 10 / (0.1 + Math.random());
			    	for (i = 0; i < m; i++) {
			      		w = (i / m - y) * z;
			      		values[i] += x * Math.exp(-w * w);
			    	}
			  	}
			
			  	// Ensure all values are positive.
				for (i = 0; i < m; ++i) {
					values[i] = Math.max(0, values[i]);
				} */
			  	
				return values;
			}
		</script>
	</body>
</html>
