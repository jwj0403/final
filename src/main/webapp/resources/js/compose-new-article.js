		// 새 게시글 구성
		function attachNewArticle(article, loginUser) {
			var articleDiv = $("<div>", {
				id : "article-" + article.articleNo,
				class : "w3-container w3-card-2 w3-white w3-round w3-margin"
			});
			var tbody = $("<tbody>");
			var tr = $("<tr>");
			var td = $("<td>");
			var br = $("<br>");
			var profileImage = $("<img>", {
				src : "/andromeda/resources/profile_images/" + article.profile.profImage,
				alt : article["profile"].content,
				class : "w3-left w3-circle w3-margin-right",
				style : "width:60px"
			});
			var timeDiffSpan = $("<span>", {
				class : "w3-right w3-opacity"
			});
			var memberNameH4 = $("<h4>");
			var memberNameSpan = $("<span>", {
				id : "memberName-" + article.articleNo
			});
			var writerIdInput = $("<input>", {
				type : "hidden",
				id : "writerId-" + article.articleNo,
				value : article["member"].memberId
			});
			var hr = $("<hr>", {
				class : "w3-clear"
			});
			var articleContentP = $("<p>");
			var likeButton = $("<button>", {
				id : "articleLike-" + article.articleNo,
				type : "button",
				class : "w3-btn w3-theme-d1 w3-margin-bottom",
				click : function(e) {
					var articleNo = $(this).attr("id").split("-")[1];
					if (!confirm("추천하시겠습니까?")) {
						return;
					}
					vote(articleNo, "G");
				}
			});
			var likeI = $("<i>", {
				class : "fa fa-thumbs-up"
			});
			var likeCountSpan = $("<span>", {
				id : "articleLikeCount-" + article.articleNo
			});
			var hateButton = $("<button>", {
				id : "articleHate-" + article.articleNo,
				type : "button",
				class : "w3-btn w3-theme-d1 w3-margin-bottom",
				click : function(e) {
					var articleNo = $(this).attr("id").split("-")[1];
					if (!confirm("비추하시겠습니까?")) {
						return;
					}
					vote(articleNo, "B");
				}
			});
			var hateI = $("<i>", {
				class : "fa fa-thumbs-down"
			});
			var hateCountSpan = $("<span>", {
				id : "articleHateCount-" + article.articleNo
			});
			var showCommentsButton = $("<button>", {
				id : "showComments-" + article.articleNo,
				type : "button",
				class : "w3-btn w3-theme-d2 w3-margin-bottom",
				click : function(e) {
					var id = $(this).attr("id");
					var articleNo = id.split("-")[1];
					hideComments(id.substring(5));
					$("#comments-" + articleNo).toggle();
					
					$("tr:visible").each(function (index) {
						$(this).removeClass();
						if (index % 2 == 0) {
					    	$(this).addClass("highlight");
						}
					});
				}
			});
			var commentCountI = $("<i>", {
				class : "fa fa-comment"
			});
			var commentCountSpan = $("<span>", {
				id : "commentCount-" + article.articleNo
			});
			
			//----------- comment div
			
			var commentsDiv = $("<div>", {
				id : "comments-" + article.articleNo,
				class : "w3-container w3-card-2 w3-white w3-round w3-margin"
			});
			var writeCommentsFormDiv = $("<div>", {
				id : "writeComments-" + article.articleNo
			});
			var writeCommentTable = $("<table>", {
				class : "w3-tag w3-small w3-theme-l5"
			});
			var writeCommentLabelSpan = $("<span>", {
				class : "w3-tag w3-small w3-theme"
			});
			var commentContentTextarea = $("<textarea>", {
				id : "commentContent-" + article.articleNo,
				class : "w3-small w3-theme-l5",
				rows : "3",
				cols : "90"
			});
			var commentRegisterLabelSpan = $("<span>", {
				id : "commentReg-" + article.articleNo, 
				class : "w3-tag w3-small w3-theme hand-cursor",
				click :  function() {
					var articleNo = $(this).attr("id").split("-")[1];
					var content = $("#commentContent-" + articleNo).val();
					if (content == "") {
						alert("댓글을 입력하세요.");
						return;
					}
					
					var params = "articleNo=" + articleNo + "&content=" + content;
					$.getJSON("article/writeComment.action?" + params, 
						function(data, status, xhr) {
							if (data["result"] == "SUCCESS") {
								//********************************************************댓글 셋팅 코드....
								composeComments(data["comments"], articleNo);
								$("#commentCount-" + articleNo).text(data["comments"].length);
							} else if (data["result"] == "FAILURE") {
								alert("댓글을 등록하지 못하였습니다. 다시 시도하시기 바랍니다.");
								return;
							}
						}
					);
					$("#commentContent-" + articleNo).val("");
				}
			});
			var commentsDisplayTable = $("<table>", {
				class : "tabler"
				//border : 1
			});
			var commentsTbody = $("<tbody>", {
				id : "commentsTbody-" + article.articleNo
			});

			// 게시글 영역 구성
			/*
			div
				br
				img
				span
					timeDiff
				h4
					name
					input
				br
				hr
				p
					articleContent
				div
				button
					i
					Like
					span
						count
				button
					i
					Hate
					span
						count
			
				button
					i
					Comment
					span
						count
			div
				div
					br
					br
					table
						tbody
							tr
								td
									span
										댓글쓰기
								td
									&nbsp;
									textarea
									&nbsp;
								td
									span
										댓글등록
				table
					tbody
			*/
			articleDiv.append(br.clone());
			articleDiv.append(profileImage);
			articleDiv.append(timeDiffSpan);
			timeDiffSpan.append(getTimeDifference(article.timeDifference));
			articleDiv.append(memberNameH4);
			memberNameH4.append(memberNameSpan);
			memberNameSpan.append(article["member"].name);
			memberNameH4.append(writerIdInput);
			articleDiv.append(br.clone());
			articleDiv.append(hr.clone());
			articleDiv.append(articleContentP);
			articleContentP.append(article.articleContent);
			articleDiv.append($("<div>"));
			articleDiv.append(likeButton);
			likeButton.append(likeI);
			likeButton.append(" &nbsp;Like ");
			likeButton.append(likeCountSpan);
			likeCountSpan.append(article.articleGoodCount);
			articleDiv.append("&nbsp;");
			articleDiv.append(hateButton);
			hateButton.append(hateI);
			hateButton.append(" &nbsp;Hate ");
			hateButton.append(hateCountSpan);
			hateCountSpan.append(article.articleBadCount);
			articleDiv.append("&nbsp;");
			articleDiv.append(showCommentsButton);
			showCommentsButton.append(commentCountI);
			showCommentsButton.append(" &nbsp;Comment ");
			showCommentsButton.append(commentCountSpan);
			commentCountSpan.append("0");
			
			commentsDiv.append(writeCommentsFormDiv);
			writeCommentsFormDiv.append(br.clone());
			writeCommentsFormDiv.append(br.clone());
			writeCommentsFormDiv.append(writeCommentTable);
			var commentTbody = tbody.clone();
			writeCommentTable.append(commentTbody);
			var commentTr = tr.clone();
			commentTbody.append(commentTr);
			var commentLabelTd = td.clone();
			commentTr.append(commentLabelTd);
			commentLabelTd.append(writeCommentLabelSpan);
			writeCommentLabelSpan.append("댓글쓰기");
			var commentTextareaTd = td.clone();
			commentTr.append(commentTextareaTd);
			commentTextareaTd.append("&nbsp;");
			commentTextareaTd.append(commentContentTextarea);
			commentTextareaTd.append("&nbsp;");
			var commentRegisterLabelTd = td.clone();
			commentTr.append(commentRegisterLabelTd);
			commentRegisterLabelTd.append(commentRegisterLabelSpan);
			commentRegisterLabelSpan.append("댓글등록");
			commentsDiv.append(commentsDisplayTable);
			commentsDisplayTable.append(commentsTbody);
			
			$("#newArticle").after(commentsDiv.before(articleDiv));
			commentsDiv.before(articleDiv);
		}
		
		// 댓글 보여주기
		function makeCommentDOM(comment, articleNo, loginUser) {
			var div = $("<div>");
			var tbody = $("<tbody>");
			var br = $("<br>");
			var tr = $("<tr>");
			var td = $("<td>");
			var writerNameSpan = $("<span>", {
				id : "comment-writer-" + comment.commentNo
			});
			var writingCommentLabelSpan = $("<span>", {
				class : "w3-tag w3-small w3-theme"
			});
			var commentWriterIdInput = $("<input>", {
				id : "commentWriterId-" + comment.commentNo,
				type : "hidden",
				name : "writerId",
				value : comment.memberId
			});
			var commentContentSpan = $("<span>", {
				id : "comment-content-" + comment.commentNo
			});
			var commentRegdateSpan = $("<span>", {
				id : "comment-regdate-" + comment.commentNo
			});
			var commentTextarea = $("<textarea>", {
				id : "commentContent-" + articleNo,
				class : "w3-small w3-theme-l5",
				rows : "3",
				cols : "90"
			});
			var commentRegSpan = $("<span>", {
				id : "commentReg-" + articleNo,
				class : "w3-tag w3-small w3-theme hand-cursor",
				click : function() {
					var articleNo = $(this).attr("id").split("-")[1];
					var content = $("#commentContent-" + articleNo).val();
					if (content == "") {
						alert("댓글을 입력하세요.");
						return;
					}
					
					var params = "articleNo=" + articleNo + "&content=" + content;
					$.getJSON("article/writeComment.action?" + params, 
						function(data, status, xhr) {
							if (data["result"] == "SUCCESS") {
								//********************************************************댓글 셋팅 코드....
								composeComments(data["comments"], articleNo);
								$("#commentCount-" + articleNo).text(data["comments"].length);
							} else if (data["result"] == "FAILURE") {
								alert("댓글을 등록하지 못하였습니다. 다시 시도하시기 바랍니다.");
								return;
							}
						}
					);
					$("#commentContent-" + articleNo).val("");
				}
			});
			var displayCommentsTable = $("<table>", {
				class : "tabler"
			});
			var commentWriterSpan = $("<span>", {
				id : "comment-writer-" + comment.commentNo
			});
			var commentContentSpan = $("<span>", {
				id : "comment-content-" + comment.commentNo
			});
			var span = $("<span>");
			var commentLikeSpan = $("<span>", {
				id : "commentLike-" + comment.commentNo + "-" + articleNo,
				class : "w3-tag w3-small w3-theme hand-cursor",
				click : function() {
					var id = $(this).attr("id");
					var commentNo = id.split("-")[1];
					var articleNo = id.split("-")[2];
					if (!confirm("댓글을 추천하시겠습니까?")) {
						return;
					}
					commentVote(articleNo, commentNo, "G");
				}
			});
			var commentLikeCountSpan = $("<span>", {
				id : "commentLikeCount-" + comment.commentNo
			});
			var commentHateSpan = $("<span>", {
				id : "commentHate-" + comment.commentNo + "-" + articleNo,
				class : "w3-tag w3-small w3-theme hand-cursor",
				click : function() {
					var id = $(this).attr("id");
					var commentNo = id.split("-")[1];
					var articleNo = id.split("-")[2];
					if (!confirm("댓글을 비추하시겠습니까?")) {
						return;
					}
					commentVote(articleNo, commentNo, "B");
				}
			});
			var commentHateCountSpan = $("<span>", {
				id : "commentHateCount-" + comment.commentNo
			});
			var commentReplySpan = $("<span>", {
				id : "commentReply-" + comment.commentNo,
				class : "w3-tag w3-small w3-theme hand-cursor",
				click : function() {
					var id = $(this).attr("id");
					hideCommentReplyForm(id.substring(1));
					$("#writeCommentReply-" + comment.commentNo).toggle();
				}
			});
			var deleteCommentSpan = $("<span>", {
				id : "deleteComment-" + comment.commentNo,
				class : "w3-tag w3-small w3-theme hand-cursor",
				click : function() {
					var id = $(this).attr("id");
					var commentNo = id.split("-")[1];
					var params = "commentNo=" + commentNo;
					
					if (!confirm("댓글을 삭제하시겠습니까?")) {
						return;
					}
					$.getJSON("article/deleteComment.action?" + params, 
						function(data, status, xhr) {
							if (data["result"] == "SUCCESS") {
								alert("성공적으로 댓글을 삭제하였습니다.");
								//********************************************************댓글 셋팅 코드....
								$("#comment-content-" + commentNo).text("[삭제됨]");
								$("#deleteComment-" + commentNo).hide();
							} else if (data["result"] == "FAILURE") {
								alert("댓글을 삭제하지 못하였습니다. 다시 시도하시기 바랍니다.");
								return;
							}
						}
					);
				}
			});
			
			
			// 댓글 구성하기
			/*
			tr
				td
					span
						memberName
						input
				td
					span
						commentContent
				td
					span
						strRegDate
				td
					span
						span
							Like
							span
								goodCount
						&nbsp;
						span
							Hate
							span
								badCount
					br
					span
			--superNo == 0이면
					span
						댓글
					&nbsp;
			-- 0이 아니면
					&nbsp; * 11
					span
						삭제
			tr
				td
					div
						table
							tbody -- 누락
								tr
									td
										span
											댓글쓰기
									td
										&nbsp;
										textarea
										&nbsp;
									td
										span
											댓글등록
			*/
			var rootTr = tr.clone();
			var td1 = td.clone();
			td1.css("width", "200px");
			rootTr.append(td1);
			td1.append(writerNameSpan);
			writerNameSpan.append(comment.memberName);
			writerNameSpan.append(commentWriterIdInput);
			
			var td2 = td.clone();
			td2.css("width", "600px");
			rootTr.append(td2);
			td2.append(commentContentSpan);
			
			if (comment.commentSuperNo == 0) { // 최상위댓글이면
				commentContentSpan.append(comment.commentContent);
			} else { // 댓글의 댓글이면
				commentContentSpan.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				commentContentSpan.append($("<img>", {
					src : "/andromeda/resources/images/re.gif"
				}));
				commentContentSpan.append("&nbsp;");
				commentContentSpan.append(comment.commentContent);
			}			
			
			var td3 = td.clone();
			td3.css("width", "200px");
			rootTr.append(td3);
			td3.append(commentRegdateSpan);
			commentRegdateSpan.append(comment.strCommentRegDate);
			
			var td4 = td.clone();
			td4.css("width", "200px");
			rootTr.append(td4);
			var span1 = span.clone();
			td4.append(span1);
			span1.append(commentLikeSpan);
			commentLikeSpan.append(" Like");
			commentLikeSpan.append(commentLikeCountSpan);
			commentLikeCountSpan.append(comment.commentGoodCount);
			span1.append("&nbsp;");
			
			span1.append(commentHateSpan);
			commentHateSpan.append(" Hate");
			commentHateSpan.append(commentHateCountSpan);
			commentHateCountSpan.append(comment.commentBadCount);
			
			br1 = br.clone();
			td4.append(br1);
			var span2 = span.clone();
			td4.append(span2);
			
			// 삭제되지 않은 글이면...
			if (comment.commentDeleted == "N") {
				// if (superNo ==0) { // 최상위댓글이면 댓글의 댓글을 쓸 수 있도록 하고,
				if (comment.commentSuperNo == 0) {
					span2.append(commentReplySpan);
					commentReplySpan.append("댓글");
					span2.append("&nbsp;");
				}
				
				// 세션검사
				if (comment.memberId == loginUser) {
					span2.append(deleteCommentSpan);
					deleteCommentSpan.append("삭제");
				}
			}
			
			return rootTr;
		}
		
		function makeCommentReplyDOM(comment, articleNo, loginUser) {
			var td = $("<td>");
			var div = $("<div>");
			var tbody = $("<tbody>");
			var tr = $("<tr>");
			var writeCommentReplyTr = $("<tr>", {
				id : "writeCommentReply-" + comment.commentNo
			});
			var commentReplyTable = $("<table>", {
				class : "w3-tag w3-small w3-theme-l5"
			});
			var writingCommentReplySpan = $("<span>", {
				class : "w3-tag w3-small w3-theme"
			});
			var commentReplyTextarea = $("<textarea>", {
				id : "commentReplyContent-" + comment.commentNo,
				class : "w3-small w3-theme-l5",
				rows : "2",
				cols : "80"
			});
			var commentReplyRegSpan = $("<span>", {
				id : "commentReplyReg-" + comment.commentNo,
				class : "w3-tag w3-small w3-theme hand-cursor",
				click : function() {
					var commentNo = $(this).attr("id").split("-")[1];
					var content = $("#commentReplyContent-" + commentNo).val();
					if (content == "") {
						alert("댓글을 입력하세요.");
						return;
					}
					
					var params = "commentNo=" + commentNo + "&content=" + content;
					$.getJSON("article/writeCommentReply.action?" + params, 
						function(data, status, xhr) {
							if (data["result"] == "SUCCESS") {
								var comments = data["comments"];
								//********************************************************댓글 셋팅 코드....
								composeCommentReply(comments);
								$("#commentCount-" + data["comments"][0].articleNo).text(data["comments"].length);
							} else if (data["result"] == "FAILURE") {
								alert("댓글을 등록하지 못하였습니다. 다시 시도하시기 바랍니다.");
								return;
							}
						}
					);
					$("#commentReplyContent-" + commentNo).val("");
				}
			});
			
			var td5 = td.clone();
			td5.attr("colspan", "4");
			writeCommentReplyTr.append(td5);
			var div1 = div.clone();
			td5.append(div1);
			div1.append(commentReplyTable);
			var tbody1 = tbody.clone();
			commentReplyTable.append(tbody1);
			var tr1 = tr.clone();
			tbody1.append(tr1);
			var td6 = td.clone();
			tr1.append(td6);
			td6.append(writingCommentReplySpan);
			writingCommentReplySpan.append("댓글쓰기");
			var td7 = td.clone();
			tr1.append(td7);
			td7.append("&nbsp;");
			td7.append(commentReplyTextarea);
			td7.append("&nbsp;");
			var td8 = td.clone();
			tr1.append(td8);
			td8.append(commentReplyRegSpan);
			commentReplyRegSpan.append("댓글등록");
			
			return writeCommentReplyTr;
		}
		
		// 댓글 구성
		function composeComments(comments, articleNo, loginUser) {
			$("#commentsTbody-" + articleNo).empty();
			for (var i = 0; i < comments.length; i++) {
				$("#commentsTbody-" + articleNo).append(makeCommentDOM(comments[i], articleNo, loginUser));
				if (comments[i].commentSuperNo == 0) {
					$("#commentsTbody-" + articleNo).append(makeCommentReplyDOM(comments[i], articleNo, loginUser));
				}
			}
			hideCommentReplyForm("all"); // 댓글의 댓글 쓰기 폼 숨기기...
			
			// tr stripe
			$("tr:visible").each(function (index) {
				$(this).removeClass();
				if (index % 2 == 0) {
			    	$(this).addClass("highlight");
				}
			});
		}
		
		// 댓글의 댓글 작성시 댓글 구성
		function composeCommentReply(comments) {
			var articleNo = comments[0].articleNo;
			composeComments(comments, articleNo);
		}
		
		// 시간차 리턴
		function getTimeDifference(timeDiffer) {
			var td = timeDiffer.split(" ");
			var days = eval(td[0]);
			var differsFromNow = "";
			try {
				if (days > 0) {
					if (days / 365 > 0) {
						differsFromNow = (days / 365) + "년 전";
					} else if (days / 30 > 0) {
						differsFromNow = (days / 30) + "월 전";
					} else {
						differsFromNow = days + "일 전";
					}
				} else {
					var time = td[1].split(":");
					if (eval(time[0]) > 0) {
						differsFromNow = time[0] + "시간 전";
					} else if (eval(time[1]) > 0) {
						differsFromNow = time[1] + "분 전";
					} else {
						differsFromNow = time[2].split(".")[0] + "초 전";
					}
				}
			} catch (e) {
				return "방금 전";
			}
			return differsFromNow;
		}
		