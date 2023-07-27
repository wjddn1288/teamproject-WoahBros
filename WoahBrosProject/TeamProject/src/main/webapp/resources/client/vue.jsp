<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.js"></script>
</head>

<body>
  <div id="app">
    {{ message }}
  </div>
  
</body>
  <script type="text/javascript">
    var app = new Vue({
      el: '#app',
      data: {
        message: '안녕하세요 Vue!'
      }
    })
  </script>
</html>