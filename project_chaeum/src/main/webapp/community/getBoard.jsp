<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세</title>
<style>
	#container { width: 700px; margin: 0 auto; }
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: orange; }
	.center { text-align: center; }
	
	.border-none, .border-none td { border: none; }
</style>
<script>
$(document).ready(function(){
	getReplyList();
});

function getReplyList() { 	
	$.ajax({
		url: "replyList.do",
		type: "get",
		dataType:"json",
		async:true,
		data:{
			board_id:"${board.board_id}"
		}, success: function(data){

				var tbody ="";

				$.each(data, function(index, reply){
					tbody += "<tr align='center' data-r_id='" + this.r_id+ "'data-board_id='" + this.board_id+"' ' >";
					tbody += "<td width=20%;>" + this.nickname + "</td>";
					tbody += "<td width=50%;>" + this.r_content + "</td>";
					tbody += "<td width=30%;>" + this.r_regdate + "</td>";
					if(this.r_writer == "${sessionScope.user.email}") {
					tbody += "<td><input type='button' class='modifyReply' id='modifyReply'  value='수정'></td>"
					tbody += "<td><input type='button' class='deleteBtn' id='deleteReply' value='삭제'></td>"
					}
					tbody += "</tr>";
					
				});
				$("#tbody").html(tbody);
				
			}, 
			error : function(jqXHR, textStatus, errorThrown){
				
			}
	});
}
	
 // Ajax 댓글작성
	function writerReply() { 
	$.ajax({
		url: "writerReply.do",
		type: "post",
		data:{
			r_content:$("#r_content").val(),
            board_id:"${board.board_id}",
            r_writer:"${sessionScope.user.email}"
		}, success: function(data){
			$("#r_content").val("");
			getReplyList(data);
		}
	});
 }	

 // 댓글 삭제
$(document).on("click", ".deleteBtn", function() {
	if(confirm("댓글을 삭제하시겠습니까?")) {
		var r_id = $(this).parent().parent().data("r_id");
		var board_id = $(this).parent().parent().data("board_id");
		
		$.ajax({
            url : 'deleteReply.do?r_id='+r_id+'&board_id='+board_id,
            type : 'GET',
            dataType : 'json',
            success : function(data) { 
            	alert("삭제가 완료되었습니다");
            	getReplyList(data);
            }       
      }); 
	}
});

// 댓글 수정 버튼 클릭 -> 폼 변경 -> 데이터 담기
$(document).on("click", ".modifyReply", function() {
   if(confirm("댓글을 수정하시겠습니까?")) {
   		var r_id = $(this).parent().parent().data("r_id");
	   
   $.ajax({
        url : 'getReply.do?r_id='+r_id, 
        type : 'get',
        contentType : 'application/json;charset=UTF-8',
        dataType : 'json',
        success : function(data) {
           ModifyReplyForm(data);
        }  
  }); 
 }
});

// 댓글 폼 만들기
function ModifyReplyForm(reply) {
	
	var output = "";
      output += '   <div class="media-body" id="modifyForm">';
      output += '     <h6><b>' + reply.nickname +'</b></h6>';
      output += '     <div style="float:left" data-r_id="' + reply.r_id + '" data-board_id="' + reply.board_id + '">';
      output += '        <textarea id="modifiedContent" rows="4" style="width:706px" placeholder="내용을 입력해주세요">' + reply.r_content +'</textarea>';      
      output += '        <button id= "modifyComplete" >수정</button>';
      output += '        <button id= "" >취소</button>';
      output += '     </div>';
      output += '   </div>';
   $("#modi").append(output);   
   
}

// 댓글 수정완료버튼

 $(document).on("click", "#modifyComplete", function() {
	 alert("여긴오나요");
      var r_content = $("#modifiedContent").val();
      var board_id = $(this).parent().data("board_id");
      var r_id  = $(this).parent().data("r_id");

       if(r_content.trim().length != 0) {
         $.ajax({
            url : 'modifyOk.do?r_id='+r_id+'&board_id='+board_id+'&r_content='+r_content,
            type : 'post',
            contentType : 'application/json;charset=UTF-8',
            dataType : 'json',
            success : function() {
            	alert("수정이 완료되었습니다.");
            	$("#modifyForm").hide();
      	       getReplyList();
            }
         });
      } 
      
   });
</script>
</head>
<body>
<div class="content-wrapper" align="center">
	<div class="row" style="width: 75%">
		<div class="col-md-12 grid-margin stretch-card">
			<div class="card position-relative">
			<br>
			<br>
			<br>
			
<div id="container">
	<h1>${board.title }</h1>
	
	<form action="updateBoard.do" method="get">
		<input type="hidden" name="seq" value="${board.board_id }">
	<table>
		
		<tr>
			<th>작성자</th>
			<td>${board.nickname }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
			${board.b_contents }
			</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${board.b_regdate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.count }</td>
		</tr>
		<c:if test ="${sessionScope.user.nickname == board.nickname}">
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="글 수정">
			</td>
		</tr>
		</c:if>
	</table>
	</form>
	
	<p>
		<c:if test ="${sessionScope.user.nickname == board.nickname}">  
		<a href="deleteBoard.do?board_id=${board.board_id }">글삭제</a>
		</c:if>
		<a href="getFreeBoardList.do">글목록</a>
	</p>
	
</div>
	<h3 align="left">댓글</h3>
     	 <ul id="replyList">
     	 </ul>
         	<table class='table table-striped table-bordered' >
			 	<tbody id="tbody">
			   		
			 	</tbody>
			 	<tfoot>
			 	<tfoot>
			 </table>	
     
      		<!-- 댓글 라인 -->
         <div class="input-group" role="group" aria-label="..." style="margin-top: 10px; width: 100%;">
   			<div id="showComment" style="text-align: center;"></div>
		 </div>

			<!-- 댓글 작성창 -->
		<div id ="modi" class="modi">
		</div>
		
		<c:if test ="${sessionScope.user.nickname ne null}">        	
   		<textarea class="form-control" rows="3" id="r_content" placeholder="댓글을 입력하세요." style="width: 100%;" ></textarea>
		
           <input type="button" class="btn btn-default" value="댓글 쓰기" id="replyWrite" onclick="writerReply()"
           style ="background-color: #BBDEFB;float: right;">
           </c:if>
		<br>
		<br>
		<br>
</div>
</div>
</div>
</div>		
</body>
</html>