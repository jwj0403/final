var timerId = 0;
var timerIdForLogonFriends = 0;
var interval = 10000;
var retrieveInterval = 15000;
var memberId = "";

function retrieveRealtimeNotifications() {
	getNotifies();
}

function getNotifies() {
	$.ajax({
		url : "notify/notifyAll.action",
		method : "POST",
		data : "",
		dataType : "text",
		success : function(data, status, xhr) {
			$("#notificationDiv").hide();
			if (data != null && data != "" && data != undefined) {
				showNotifications(data);
			}
		},
		error : function(xhr, status, e) {
			
		}
	});
	timerId = setTimeout(retrieveRealtimeNotifications, retrieveInterval);
}

function showNotifications(content) {
	$("#notificationContentDiv").empty();
	$("#notificationContentDiv").append(content);
	$("#notificationDiv").fadeTo("slow", 0.7);
	setTimeout(hideNotificationDiv, interval);
}

function hideNotificationDiv() {
	$("#notificationDiv").fadeTo("slow", 0);
}

function retrieveLogonFriends(id) {
	if (id != undefined) {
		memberId = id;
	}
	$.ajax({
		url : "notify/retrieveLogonFriends.action?memberId=" + memberId,
		method : "POST",
		data : "",
		dataType : "text",
		success : function(data, status, xhr) {
			var json = eval("(" + data + ")");
			if (json["friends"].length > 0) {
				$("#friendNamesDiv").empty();
				showLogonFriends(json["friends"]);
			}
		},
		error : function(request, status, error) {
			
		}
	})
	timerIdForLogonFriends = setTimeout(retrieveLogonFriends, retrieveInterval);
}

function showLogonFriends(friends){
	$("#friendNamesDiv").empty();
	for (var i = 0; i < friends.length; i++) {
		$("#friendNamesDiv").append(friends[i].buddyName + "<br>");
	}
	$("#logonFriendsDiv").fadeTo("slow", 0.9);
}
