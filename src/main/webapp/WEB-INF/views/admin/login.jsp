<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 로그인</title>
        <link href="/resources/include/dist/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="/resources/include/js/jquery-3.6.3.min.js"></script>
        <script type="text/javascript" src="/resources/include/js/common.js"></script>
        <script type="text/javascript">
        	$(function(){
        		let errorMsg = "${errorMsg}";
    			if(errorMsg!=""){
    				alert(errorMsg);
    				errorMsg = "";
    			}
    			
    			$("#loginBtn").click(function(){
    				if(!chkData("#mng_id","아이디를")) return;
    				else if(!chkData("#mng_pwd","비밀번호를")) return;
    				else {
    					$("#loginForm").attr({
    						"method" : "post",
    						"action" : "/admin/login"
    					});
    					$("#loginForm").submit();
    				}
    			});
        	});// $종료
        </script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">관리자 로그인</h3></div>
                                    <div class="card-body">
                                        <form id="loginForm">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" type="text" id="mng_id" name="mng_id"/>
                                                <label for="mng_id">Id</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" type="password" id="mng_pwd" name="mng_pwd"/>
                                                <label for="mng_pwd">Password</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="password.html"></a>
                                                <button class="btn btn-primary" type="button" id="loginBtn">Login</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/include/js/scripts.js"></script>
    </body>
</html>
    