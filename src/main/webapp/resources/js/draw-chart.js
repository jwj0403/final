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
		
		// div 하위의 svg(트리차트)를 비운다.
		if (!!$("#chart").length) {
			$("#chart svg").empty(); // div 삭제하고...
		}
		if (!(!!$("form#svg").length)) {
			$("#search-conditions").after($("<form>", {
				"id": "svg"
			}));
			$("#svg").append($("<label>").append($("<input>", {
				"type": "radio",
				"name": "mode",
				"value": "grouped",
				"id": "grouped"
			})).append(" Grouped").after($("<br>")));
			$("#svg").append($("<label>").append($("<input>", {
				"type": "radio",
				"name": "mode",
				"value": "stacked",
				"id": "stacked"
			})).append(" Stacked"));
		}
		
		$.ajax({
			type: "GET",
			url: "../analyze/analyze.action",
			data: $("#conditions").serialize(),
			success: function(data, textStatus) {
				initBarVariables(data.condition, data.data, data.xAxisLabel);
				showBarChart();
				timeout;
				changed();
				transitionStacked()
				setTimeout(transitionGrouped, 2000);
				$("#grouped").prop("checked", true);
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
	if (!!$("svg").length) {
		$("svg").remove(); // <svg>
	}
	if (!!$("#svg").length) {
		$("#svg").remove(); // form#svg
	}
	if (!!$("#chart").length) {
		$("#chart").empty(); // div empty
	}
	if (!(!!$("#chart").length)) {
		$("#search-conditions").after($("<div>", {
			"id": "chart"
		}));
	} // <div id="chart"> 추가
	
	// 상품트리 로드
	$("#chart").empty();
	$.getJSON("../analyze/productTreeChart.action", 
		function(data, status, xhr) {
			initTreeVariables();
			showTree();
			showConditions("show");
		}
	);
}

function showConditions(flag) {
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