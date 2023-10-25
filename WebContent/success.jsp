<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<head>
 <link rel="icon" href="images/babyl.jpg" type="image/png" >
    <meta charset="UTF-8">
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'/>
    <style>
		    body{
		    font-family: Poppins;
		    min-height: 100vh;
		    background: #F3F1EC;
		}
		.trigger_popup{
		    cursor: pointer;
		    font-size: 20px;
		    text-decoration: none;
		    font-weight: bold;
		    color: white;
		    padding: 20px;
		}
		
		
				#success {
		    display: block;
		    position: fixed;
		    top: 20%;
		    left: 38%;
		}
		
			.popup-content {
	    width: 326px;
	    height: 408px;
	    background: white;
	    box-shadow: 4px 4px 70px 10px rgb(0 0 0/11%);
	    border-radius: 25px;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    justify-content: center;
	    text-align: center;
	}
		.imgbox{
		    text-align: center;
		}
		.img{
		    width: 100px;
		    margin-top: 40px;
		}
		.title{
		    font-weight: 500;
		    font-size: 24px;
		   letter-spacing: 0.05em;
		   text-align: center;
		   margin: auto;
		}
		#success .title{
		   color: #32ba7c;
		}
		#error .title{
		    color: #ff3636;
		}
		.para{
		    font-weight: 500;
		    width: 80%;
		    font-size: 18px;
		    line-height: 30px;
		    letter-spacing: 0.05em;
		    text-align: center;
		    margin: auto;
		
		
		}
		.button{
		    width: 70%;
		    display: block;
		    margin: 20px auto;
		    border-radius: 25px;
		    padding: 10px;
		    text-decoration: none;
		    color: white;
		    text-align: center;
		    letter-spacing: 0.05em;
		}
		#s_button{
		    background: #32ba7c;
		}
    </style>
    
    <title>Successfully Done</title>
  </head>
  <body>
   
    <div class="popup" id="success">
      <div class="popup-content">
        <div class="imgbox">
          <img src="./images/checked.png"  alt="" class="img">
          
        </div>
        <div class="title">
          <h3>Success!</h3>
        </div>
        <p class="para">Action done successfully</p>
        <form action="">
         <a href="productview.jsp" class="button button-center" id="s_button">OKAY</a>
        </form>         
        </div>
        </div>
       </body> 
       <script>
       var success_popup=document.getElementById("success");
       
       var s_close=document.getElementById("s_button");
     
       var s_btn =document.getElementById("success_trigger");
      
       s_btn.onclick=function(){
           success_popup.style.display ="block";
       }
       e_btn.onclick =function(){
           error_popup.style.display="block";
       }
       s_close.onclick =function(){
           success_popup.style.display="none";
       }
       e_close.onclick=function(){
           error_popup.style.display="none";
       }
       </script>
</html>

