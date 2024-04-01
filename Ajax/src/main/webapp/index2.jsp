<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">



<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>



<script>

function searchFunction() {

    var userName = $('#userName').val();

    var URL = "/jsp/UserSearchServlet?userName=" + userName;

    $.ajax({

       method : "POST",

      url : URL,

     success : searchProcess  

   });

}

 

function searchProcess(data) {

   var table=$('#ajaxTable');

   table.innerHTML = "";

 

   var object = eval‎("(" + data + ")");

 

  // console.log(object);

  var result = object.result;

  // console.log(result[1]);

  var out="";

  $.each(result,function(i,a){

     out+="<tr>";

      out+="<td>"+a[0].name+"</td>";

       out+="<td>"+a[1].age+"</td>";

       out+="<td>"+a[2].gender+"</td>";

      out+="<td>"+a[3].email+"</td>";

 

        console.log(a[0].name,a[1].age, a[2].gender, a[3].email);

        out+='</tr>';

   });

      table.empty();

      $(out).appendTo(table);

   }

 

  $(function() {

     searchFunction();

  })

 

/* window.xxxxonload = function() {

searchFunction();

} */

 

function registerFunction() {

 

   var registerName = $("#registerName").val();

   var registerAge = $("#registerAge").val();

   var registerGender = $('input[name=registerGender]:checked').val();

   var registerEmail = $("#registerEmail").val();

 

  var url = "/jsp/UserRegisterServlet?userName=" + registerName

+ "&userAge=" + registerAge;

url += "&userGender=" + registerGender + "&userEmail=" + registerEmail;

 

  $.ajax({

      method : "POST",

      url : url,

     success : registerProcess  // 1 or -1

   });

}

 

function registerProcess(data) {

    if (!data) {

      alert(‎"회원등록에 실패했습니다.");

   } else {

      alert(‎"회원등록에 성공했습니다.");

       $('#registerName').val("");

       $('#registerAge').val("");

       $('#registerEmail').val("");

     searchFunction();

   }

}

</script>



</head>

<body>

	<div class="container" style="margin-top: 10px">

		<div class="form-group row pull-right">

			<div class="col-xs-8">

				<input class="form-control" type="text" size="20" id="userName"
					xxxxonkeyup="searchFunction()">

			</div>

			<div class="col-xs-2">

				<button class="btn btn-primary" type="button"
					xxxxonclick="searchFunction()">검색</button>

			</div>

		</div>



		<table class="table"
			style="text-align: center; border: 1px solid #ddd">

			<thead>

				<tr>

					<th style="background-color: #fafafa; text-align: center">이름</th>

					<th style="background-color: #fafafa; text-align: center">나이</th>

					<th style="background-color: #fafafa; text-align: center">성별</th>

					<th style="background: #fafafa; text-align: center">이메일</th>

				</tr>

			</thead>

			<tbody id="ajaxTable">

				<tr>

					<td>나동빈</td>

					<td>2</td>

					<td>남자</td>

					<td>anc@daum.net</td>
			</tbody>

		</table>

	</div>



	<!-- 회원등록양식 -->

	<div class="container">

		<table class="table"
			style="text-align: center; border: 1px solid #ddd">

			<thead>

				<tr>

					<th colspan="2"
						style="background-color: #fafafa; text-align: center">회원 등록
						양식</th>

				</tr>

			</thead>

			<tbody>

				<tr>

					<td style="background: #fafafa; text-align: center"><h5>이름</h5></td>

					<td><input class="form-control" type="text" id="registerName"
						size="20"></td>

				</tr>



				<tr>

					<td style="background: #fafafa; text-align: center"><h5>나이</h5></td>

					<td><input class="form-control" type="text" id="registerAge"
						size="20"></td>

				</tr>

				<tr>

					<td style="background: #fafafa; text-align: center"><h5>성별</h5></td>

					<td>

						<div class="form-group"
							style="text-align: center; margin: 0 auto;">

							<div class="btn-group" data-toggle="buttons">

								<label class="btn btn-primary active"> <input
									type="radio" name="registerGender" autocomplete="off"
									value="남자" checked>남자

								</label> <label class="btn btn-primary active"> <input
									type="radio" name="registerGender" autocomplete="off"
									value="여자" checked>여자

								</label>

							</div>

						</div>

					</td>

				</tr>

				<tr>

					<td style="background: #fafafa"; text-align:center"><h5>이메일</h5></td>

					<td><input class="form-control" type="text" id="registerEmail"
						size="20"></td>

				</tr>

				<td colspan="2"><button class="btn btn-primary pull-right"
						onclick="registerFunction()" type="button">등록</button></td>

			</tbody>

		</table>

	</div>



</body>

</html>