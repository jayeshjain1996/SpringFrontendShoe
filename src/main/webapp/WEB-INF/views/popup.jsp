<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.js"></script>
    </head>
    <body>
        <label id="msg" style="display:none">${msg}</label>
        <label id="type" style="display:none">${type}</label>
        <label id="pagename" style="display:none">${pagename}</label>
        <script>
            $(document).ready(function()
            {
                var m=$("#msg").text();
                var t=$("#type").text();
                var p=$("#pagename").text();
                setTimeout(function() 
                {
                    swal({
                        title: "Alert!!!",
                        text: m,
                       type: t
                 }, function() {
                    window.location = "/SpringFrontendShoe"+p;
                    });
                }, 1);
            });
        </script>
       
    </body>
</html>